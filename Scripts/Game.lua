dofile("./Lib/Init.lua")
print("Game.lua loaded")

Game = class(nil)

function Game:__init()
    print("Game.ctor")
end

-- Game callbacks

function Game:server_onCreate()
    print("Game:server_onCreate()")

    self.sv = {}
    self.sv.saved = self.storage:load() or { firstTimeSetup = true, world = sm.world.createWorld("$CONTENT_DATA/Scripts/World.lua", "World") }

    if self.sv.saved.firstTimeSetup then
        self.sv.saved.firstTimeSetup = false
        sm.scriptableObject.createScriptableObject(sm.uuid.new("39016018-2aff-48f6-8242-97f58d1b97c5"))
        self.storage:save(self.sv.saved)
    end
end

function Game:server_onDestroy()
    print("Game:server_onDestroy()")
end

function Game:server_onRefresh()
    sm.game.setLimitedInventory(true)
end

function Game:server_onFixedUpdate(ts)

end
--
function Game:client_onCreate()
    print("Game:client_onCreate()")
end

function Game:client_onDestroy()
    print("Game:client_onDestroy()")
end

function Game:client_onRefresh()

end

function Game:client_onFixedUpdate(ts)

end

function Game:client_onUpdate(dt)

end

function Game:client_onClientDataUpdate(data, channel)

end

function Game:client_onEvent(event, args)

end

-- Network callbacks

function Game:net_server_callback(args, player)

end

function Game:net_client_callback(args)

end

-- Event callbacks

function Game:event_callback(event, args)

end

-- Game callbacks

function Game:server_onPlayerJoined(player, isNewPlayer)
    print("Game:server_onPlayerJoined()")
    if isNewPlayer then
        if not sm.exists(self.sv.saved.world) then
            sm.world.loadWorld(self.sv.saved.world)
        end
        self.sv.saved.world:loadCell(0, 0, player, "sv_createPlayerCharacter")
    end
end


function Game:server_onPlayerLeft(player)
    print("Game:server_onPlayerLeft()")
end

function Game:sv_createPlayerCharacter(world, x, y, player, params)
    local character = sm.character.createCharacter(player, world, sm.vec3.new(32, 32, 5), 0, 0)
    player:setCharacter(character)
end

function Game:client_onLoadingScreenLifted()
    print("Game:client_onLoadingScreenLifted()")
end

function Game:client_onLanguageChange(language)
    print("Game:client_onLanguageChange()")
end
