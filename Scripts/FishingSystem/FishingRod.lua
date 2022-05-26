FishingRod = class()

print("FishingRod.lua loaded")

FishingRod = class()
FishingRod.sv = nil

function FishingRod:__init()
    print("FishingRod.ctor")
end

function FishingRod:server_onCreate()
    print("FishingRod:server_onCreate()")
    self.sv = {}
    self.sv.saved = self.storage:load() or { firstTimeSetup = true, attachedBait = {} }

    if self.sv.saved.firstTimeSetup then
        self.storage:save(self.sv.saved)
    end
end

function FishingRod:server_onDestroy()
    print("FishingRod:server_onDestroy()")
end

function FishingRod:server_onRefresh()

end

function FishingRod:server_onFixedUpdate(ts)

end
--
function FishingRod:client_onCreate()
    print("FishingRod:client_onCreate()")
end

function FishingRod:client_onDestroy()
    print("FishingRod:client_onDestroy()")
end

function FishingRod:client_onRefresh()

end

function FishingRod:client_onFixedUpdate(ts)

end

function FishingRod:client_onUpdate(dt)

end

function FishingRod:client_onClientDataUpdate(data, channel)

end

function FishingRod:client_onEvent(event, args)

end

-- Network callbacks

function FishingRod:net_server_callback(args, player)

end

function FishingRod:net_client_callback(args)

end

-- Event callbacks

function FishingRod:event_callback(event, args)

end

-- FishingRod callbacks

function FishingRod:server_onEquip(args, player)
    g_fishingSystem:server_opentSession(player, self)
end

function FishingRod:client_onEquip(animate)
    print("FishingRod:client_onEquip()")
    self.network:sendToServer("server_onEquip")
end

function FishingRod:server_onUnequip(args, player)
    g_fishingSystem:server_closeSession(player)
end

function FishingRod:client_onUnequip(animate)
    print("FishingRod:client_onUnequip()")
    self.network:sendToServer("server_onUnequip")
end

function FishingRod:server_toggleFishing(args, player)
    -- Get the bait and change some stuff to pass to the fishing system
    g_fishingSystem:server_toggleFishing(args, player)
end

function FishingRod:client_onEquippedUpdate(primaryState, secondaryState)
    print("FishingRod:client_onEquippedUpdate()")
    if primaryState == sm.tool.interactState.start then
        self.network:sendToServer("server_toggleFishing")
    end

    return false, false
end

function FishingRod:client_onToggle()
    print("FishingRod:client_onToggle()")
    return false
end

function FishingRod:client_onReload()
    print("FishingRod:client_onReload()")
    return false
end

function FishingRod:client_canEquip()
    return true
end

