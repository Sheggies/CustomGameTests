FishingSessionState = {
    STOPPED = 0,
    IDLE = 1,
    LURED = 2,
    HOOKED = 3,
    LOST = 4
}

FishingSystem = class()
FishingSystem.isSaveObject = true
FishingSystem.sv = nil
FishingSystem.config = nil
FishingSystem.baits = nil
FishingSystem.fishes = nil
FishingSystem.baitFishMap = nil
FishingSystem.sessions = nil

local function server_mapBaitsToFish(self)
    for fishUuid, fishConfig in pairs(self.fishes) do
        for baitUuid in pairs(fishConfig.baits) do
            self.baitFishMap[baitUuid] = self.baitFishMap[baitUuid] or {}
            table.insert(self.baitFishMap[baitUuid], fishUuid)
        end
    end
end

local function server_getLureChances(self, bait)
    local lureChanceTable = {}
    local maxLureChance = 0

    for fishUuid, fishConfig in pairs(self.fishes) do
        local fishBaitConfig = fishConfig.baits[bait:getUuid()]

        if fishBaitConfig ~= nil then
            lureChanceTable[fishUuid] = fishBaitConfig.lureChance
            maxLureChance = maxLureChance + fishBaitConfig.lureChance
        else
            lureChanceTable[fishUuid] = fishConfig.defaultLureChance
            maxLureChance = maxLureChance + fishConfig.defaultLureChance
        end
    end

    return lureChanceTable, maxLureChance
end

local function server_determineFish(self, lureChanceTable, maxLureChance)
    local chance, runningChance = math.random(0, maxLureChance), 0

    for fishUuid, lureChance in pairs(lureChanceTable) do
        runningChance = runningChance + lureChance

        if runningChance > chance then
            return fishUuid, self.fishes[fishUuid]
        end
    end
end

function FishingSystem:server_onCreate()
    self.config = sm.json.open("$CONTENT_DATA/FishingConfiguration/system.json")
    self.baits = sm.json.open("$CONTENT_DATA/FishingConfiguration/baits.json")
    self.fishes = sm.json.open("$CONTENT_DATA/FishingConfiguration/fishes.json")
    self.baitFishMap = {}
    server_mapBaitsToFish(self)

    self.sv.saved = self.storage:load() or { firstTimeSetup = true }

    if self.sv.saved.firstTimeSetup then
        self.storage:save(self.sv.saved)
    end

    g_fishingSystem = self
end

function FishingSystem:server_onFixedUpdate(ts)
    for player, session in pairs(self.sessions) do
        self:server_handleSession(ts, player, session)
    end
end

function FishingSystem:server_toggleFishing(args, player)
    if self.sessions[player].state == FishingSessionState.STOPPED then
        self:server_startFishing(args, player)
    else
        self:server_stopFishing(args, player)
    end
end

function FishingSystem:server_startFishing(args, player)
    self.sessions[player].state = FishingSessionState.IDLE
    local bait, fish = self:server_prepareFish(player, args.bait)
    self.sessions[player].environment = {
        fishingStart = sm.game.getCurrentTick(),
        spawnDelay = math.random(self.config.spawnDelay.min, self.config.spawnDelay.max),
        biteDelay = math.random(self.config.biteDelay.min, self.config.biteDelay.max),
        reelInTime = math.random(self.config.reelInTime.min, self.config.reelInTime.max),
        throwForce = math.random(self.config.throwForce.min, self.config.throwForce.max),
        bait = bait,
        fish = fish
    }
end

function FishingSystem:server_stopFishing(args, player)
    self.sessions[player].state = FishingSessionState.STOPPED
end

function FishingSystem:server_prepareFish(player, bait)
    bait = bait or Bait.new(tostring(sm.uuid.getNil()), "Hook", math.random(0, 1))
    local fishUuid, fishConfig = server_determineFish(self, server_getLureChances(self, bait))
    local fishBaitConfig = fishConfig.baits[bait:getUuid()]
    local biteSize = math.max(fishBaitConfig and fishBaitConfig.biteSize, fishConfig.defaultBiteSize)

    return bait, Fish.new(fishUuid, fishConfig.name, biteSize)
end

function FishingSystem:server_openSession(player, rod)
    self.sessions[player] = self.sessions[player] or {
        rod = rod,
        state = FishingSessionState.IDLE,
        environment = {
            fishingStart = nil,
            spawnDelay = nil,
            spawnTime = nil,
            biteDelay = nil,
            hookTime = nil,
            reelInTime = nil,
            throwForce = nil,
            bait = nil,
            fish = nil
        }
    }
end

function FishingSystem:server_closeSession(player)
    self.session[player] = nil
end

function FishingSystem:server_handleSession(ts, player, session)
    if self.fishingStart ~= nil then
        -- If fish has been lost and and hook has not redeployed, do nothing
        if session.state == FishingSessionState.STOPPED then
            return
        end

        -- If hook has been deployed recently and the spawn delay elapsed, lure in fish
        if session.state == FishingSessionState.IDLE
        and session.environment.fishingStart + session.environment.spawnDelay == sm.game.getCurrentTick() then
            session.state = FishingSessionState.LURED
            session.environment.spawnTime = sm.game.getCurrentTick()
            self.network:sendToClient(player, "client_spawnFish", { session = session, path = nil })

            return
        end

        -- If fish is lured in, traveling time/bite delay has elapsed and there's bait left to bite off, hook in the fish
        if session.state == FishingSessionState.LURED
        and session.environment.bait:hasRemainsLeft()
        and (session.environment.spawnTime + session.environment.biteDelay == sm.game.getCurrentTick()
        or session.environment.hookTime + session.environment.biteDelay == sm.game.getCurrentTick) then
            session.state = FishingSessionState.HOOKED
            session.environment.hookTime = sm.game.getCurrentTick()
            session.environment.bait:biteOff(session.environment.fish)
            -- Also consume the bait from the inventory
            self.network:sendToClient(player, "client_bite")

            return
        end

        -- If the fish is hooked in, the reel in time elapsed and bait remains left, return back to lured state.
        -- The fish is lost if no more bait is left after hook time elapsed.
        if session.state == FishingSessionState.HOOKED
        and session.environment.hookTime + session.environment.reelInTime == sm.game.getCurrentTick() then
            session.state = session.environment.bait:hasRemainsLeft() and FishingSessionState.LURED or FishingSessionState.LOST

            return
        end

        -- If the fish is lost, stop fishing and reset fishing state. The player has to redeploy the hook after this.
        if session.state == FishingSessionState.LOST then
            self:server_stopFishing(nil, player)
            self.network:sendToClient(player, "client_despawnFish")

            return
        end
    end
end
