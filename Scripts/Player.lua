print("Player.lua loaded")

Player = class()

function Player:server_onCreate()
    print("Player:server_onCreate()")
end

function Player:server_onDestroy()
    print("Player:server_onDestroy()")
end

function Player:server_onRefresh()

end

function Player:server_onFixedUpdate(ts)

end
--
function Player:client_onCreate()
    print("Player:client_onCreate()")
end

function Player:client_onDestroy()
    print("Player:client_onDestroy()")
end

function Player:client_onRefresh()

end

function Player:client_onFixedUpdate(ts)

end

function Player:client_onUpdate(ds)

end

function Player:client_onClientDataUpdate(data, channel)

end

function Player:client_onEvent(event, args)

end

-- Network callbacks

function Player:net_server_callback(args, player)

end

function Player:net_client_callback(args)

end

-- Event callbacks

function Player:event_callback(event, args)

end

-- Player callbacks

function Player:server_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("Player:server_onCollision()")
end

function Player:server_onCollisionCrush()
    print("Player:server_onCollisionCrush()")
end

function Player:server_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("Player:server_onProjectile()")
end

function Player:server_onShapeRemoved(items)
    print("Player:server_onShapeRemoved()")
end

function Player:server_onInventoryChanges(inventory, changes)

end

function Player:server_onExplosion(center, destructionLevel)
    print("Player:server_onExplosion()")
end

function Player:server_onMelee(position, attacker, damage, power, direction, normal)
    print("Player:server_onMelee()")
end

function Player:server_onRemoved(player)
    print("Player:server_onRemoved()")
end

function Player:server_canErase()
    print("Player:server_canErase()")
end
--
function Player:client_onCancel()

end

function Player:client_onReload()

end

function Player:client_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("Player:client_onProjectile()")
end

function Player:client_onMelee(position, attacker, damage, power, direction, normal)
    print("Player:client_onMelee()")
end

function Player:client_canErase()
    print("Player:client_canErase()")
end

function Player:client_onInteract(character, state)
    print("Player:client_onInteract()")
end

function Player:client_canInteract(character)
    print("Player:client_canInteract()")
end

function Player:client_onAction(action, state)
    print("Player:client_onAction()")
end
