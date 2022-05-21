print("BackpackManager.lua loaded")

BackpackManager = class()
BackpackManager.isSaveObject = true
BackpackManager.sv = nil
BackpackManager.dropQueue = nil

function BackpackManager:__init()
    print("BackpackManager.ctor")
end

function BackpackManager:server_onCreate()
    print("BackpackManager:server_onCreate()")
    self.sv = {}
    self.sv.saved = self.storage:load() or { firstTimeSetup = true, register = {} }
    self.dropQueue = {}
    _G.backpackMgr = self.scriptableObject

    if self.sv.saved.firstTimeSetup then
        self.sv.saved.firstTimeSetup = false
        self.storage:save(self.sv.saved)
    end

    print(self)
end

function BackpackManager:server_onDestroy()
    print("BackpackManager:server_onDestroy()")
    self.storage:save(self.sv.saved)
end

function BackpackManager:server_onRefresh()
    print(self.sv.saved.register)
end

function BackpackManager:server_onFixedUpdate(ts)

end
--
function BackpackManager:client_onCreate()
    print("BackpackManager:client_onCreate()")
end

function BackpackManager:client_onDestroy()
    print("BackpackManager:client_onDestroy()")
end

function BackpackManager:client_onRefresh()

end

function BackpackManager:client_onFixedUpdate(ts)

end

function BackpackManager:client_onUpdate(ds)

end

function BackpackManager:client_onClientDataUpdate(data, channel)

end

function BackpackManager:client_onEvent(event, args)

end

-- Custom methods

function BackpackManager:server_onUnload()
    print("BackpackManager:server_onUnload()")
end

function BackpackManager:server_registerBackpack(args)
    print("BackpackManager:server_registerBackpack()")
    self.sv.saved.register[args.tool.id] = { shape = args.shape, harvestable = nil }
    self.storage:save(self.sv.saved)
end

function BackpackManager:server_unregisterBackpack(args)
    print("BackpackManager:server_unregisterBackpack()")
    self.sv.saved.register[args.tool.id] = nil
    self.storage:save(self.sv.saved)
end

function BackpackManager:server_playerInventoryChanged(args)
    print("BackpackManager:server_playerInventoryChanged()")
    for i, item in ipairs(args.changes) do
        if tostring(item.uuid) == "b1953d36-6868-4170-a7fd-861628c6eac1" and item.difference < 0 then
            print("Backpack removed from inventory!")
            table.insert(self.dropQueue, { player = args.player, shape = self.sv.saved.register[item.tool.id], queuedAtTick = sm.game.getCurrentTick() })
        end
    end
end

function BackpackManager:server_projectileFired(args)
    print("BackpackManager:server_projectileFired")

    -- If the inventory change happened in the current tick, the fired projectile of type `loot` corresponds to the changed inventory item
    local drop = self.dropQueue[#self.dropQueue]
    drop.spawnHarvestable = drop ~= nil and args.shooter == drop.player and args.projectileName == "loot" and drop.queuedAtTick == sm.game.getCurrentTick()
end

function BackpackManager:server_projectileHitWorld(args)
    print("BackpackManager:server_projectileHitWorld()")

    -- Check if the projectile is the backpack tool and of type `loot`
    if tostring(args.uuid) == "45209992-1a59-479e-a446-57140b605836"
    and tostring(args.customData.lootUid) == "b1953d36-6868-4170-a7fd-861628c6eac1" then
        print("Backpack touched the ground")
        sm.event.sendToWorld(
            args.world,
            "server_spawnHarvestable",
            {
                uuid = sm.uuid.new("b4fd8b2d-5c2c-4994-b445-3fb7932e87f1"),
                position = args.position,
                drop = table.remove(self.dropQueue)
            }
        )
    end
end
