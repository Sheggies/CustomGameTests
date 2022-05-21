print("BackpackHarvestable.lua loaded")

BackpackHarvestable = class()

function BackpackHarvestable:__init()
    print("BackpackHarvestable.ctor")
end

-- Base callbacks

function BackpackHarvestable:server_onCreate()
    print("BackpackHarvestable:server_onCreate()")
end

function BackpackHarvestable:server_onDestroy()
    print("BackpackHarvestable:server_onDestroy()")
end

function BackpackHarvestable:server_onRefresh()
    print(self)
end

function BackpackHarvestable:server_onFixedUpdate(ts)

end
--
function BackpackHarvestable:client_onCreate()
    print("BackpackHarvestable:client_onCreate()")
end

function BackpackHarvestable:client_onDestroy()
    print("BackpackHarvestable:client_onDestroy()")
end

function BackpackHarvestable:client_onRefresh()

end

function BackpackHarvestable:client_onFixedUpdate(ts)

end

function BackpackHarvestable:client_onUpdate(dt)

end

function BackpackHarvestable:client_onClientDataUpdate(data, channel)

end

function BackpackHarvestable:client_onEvent(event, args)

end

-- Network callbacks

function BackpackHarvestable:net_server_callback(args, player)

end

function BackpackHarvestable:net_client_callback(args)

end

-- Event callbacks

function BackpackHarvestable:event_callback(event, args)

end

-- BackpackHarvestable callbacks

function BackpackHarvestable:server_onUnload()
    print("BackpackHarvestable:server_onUnload()")
end

function BackpackHarvestable:server_onReceiveUpdate()
    print("BackpackHarvestable:server_onReceiveUpdate()")
end

function BackpackHarvestable:server_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("BackpackHarvestable:server_onCollision()")
end

function BackpackHarvestable:server_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("BackpackHarvestable:server_onProjectile()")
end

function BackpackHarvestable:server_onExplosion(center, destructionLevel)
    print("BackpackHarvestable:server_onExplosion()")
end

function BackpackHarvestable:server_onMelee(position, attacker, damage, power, direction, normal)
    print("BackpackHarvestable:server_onMelee()")
end

function BackpackHarvestable:server_onRemoved(player)
    print("BackpackHarvestable:server_onRemoved()")
end

function BackpackHarvestable:server_canErase()
    print("BackpackHarvestable:server_canErase()")
end
--
function BackpackHarvestable:client_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("BackpackHarvestable:client_onCollision()")
end

function BackpackHarvestable:client_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("BackpackHarvestable:client_onProjectile()")
end

function BackpackHarvestable:client_onMelee(position, attacker, damage, power, direction, normal)
    print("BackpackHarvestable:client_onMelee()")
end

function BackpackHarvestable:client_canErase()
    print("BackpackHarvestable:client_canErase()")
end

function BackpackHarvestable:client_onInteract(character, state)
    print("OAS")
    self.network:sendToServer("server_pickupBackpack")
end

function BackpackHarvestable:client_canInteract(character)
    print("OIU")
    return true
end

function BackpackHarvestable:client_onAction(action, state)

end

-- Custom methods

function BackpackHarvestable:server_pickupBackpack(args, player)
    print(player)
end
