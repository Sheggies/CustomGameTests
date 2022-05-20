print("Harvestable.lua loaded")

Harvestable = class()

-- Base callbacks

function Harvestable:server_onCreate()
    print("Harvestable:server_onCreate()")
end

function Harvestable:server_onDestroy()
    print("Harvestable:server_onDestroy()")
end

function Harvestable:server_onRefresh()

end

function Harvestable:server_onFixedUpdate(ts)

end
--
function Harvestable:client_onCreate()
    print("Harvestable:client_onCreate()")
end

function Harvestable:client_onDestroy()
    print("Harvestable:client_onDestroy()")
end

function Harvestable:client_onRefresh()

end

function Harvestable:client_onFixedUpdate(ts)

end

function Harvestable:client_onUpdate(dt)

end

function Harvestable:client_onClientDataUpdate(data, channel)

end

function Harvestable:client_onEvent(event, args)

end

-- Network callbacks

function Harvestable:net_server_callback(args, player)

end

function Harvestable:net_client_callback(args)

end

-- Event callbacks

function Harvestable:event_callback(event, args)

end

-- Harvestable callbacks

function Harvestable:server_onUnload()
    print("Harvestable:server_onUnload()")
end

function Harvestable:server_onReceiveUpdate()
    print("Harvestable:server_onReceiveUpdate()")
end

function Harvestable:server_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("Harvestable:server_onCollision()")
end

function Harvestable:server_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("Harvestable:server_onProjectile()")
end

function Harvestable:server_onExplosion(center, destructionLevel)
    print("Harvestable:server_onExplosion()")
end

function Harvestable:server_onMelee(position, attacker, damage, power, direction, normal)
    print("Harvestable:server_onMelee()")
end

function Harvestable:server_onRemoved(player)
    print("Harvestable:server_onRemoved()")
end

function Harvestable:server_canErase()
    print("Harvestable:server_canErase()")
end
--
function Harvestable:client_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("Harvestable:client_onCollision()")
end

function Harvestable:client_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("Harvestable:client_onProjectile()")
end

function Harvestable:client_onMelee(position, attacker, damage, power, direction, normal)
    print("Harvestable:client_onMelee()")
end

function Harvestable:client_canErase()
    print("Harvestable:client_canErase()")
end

function Harvestable:client_onInteract(character, state)

end

function Harvestable:client_canInteract(character)

end

function Harvestable:client_onAction(action, state)

end
