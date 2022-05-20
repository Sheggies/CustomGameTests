print("Shape.lua loaded")

Shape = class()

function Shape:__init()
    print("Shape.ctor")
end

function Shape:server_onCreate()
    print("Shape:server_onCreate()")
end

function Shape:server_onDestroy()
    print("Shape:server_onDestroy()")
end

function Shape:server_onRefresh()

end

function Shape:server_onFixedUpdate(ts)

end
--
function Shape:client_onCreate()
    print("Shape:client_onCreate()")
end

function Shape:client_onDestroy()
    print("Shape:client_onDestroy()")
end

function Shape:client_onRefresh()

end

function Shape:client_onFixedUpdate(ts)

end

function Shape:client_onUpdate(ds)

end

function Shape:client_onClientDataUpdate(data, channel)

end

function Shape:client_onEvent(event, args)

end

-- Network callbacks

function Shape:net_server_callback(args, player)

end

function Shape:net_client_callback(args)

end

-- Event callbacks

function Shape:event_callback(event, args)

end

-- Shape callbacks

function Shape:server_onUnload()
    print("Shape:server_onUnload()")
end

function Shape:server_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("Shape:server_onCollision()")
end

function Shape:server_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("Shape:server_onProjectile()")
end

function Shape:server_onExplosion(center, destructionLevel)
    print("Shape:server_onExplosion()")
end

function Shape:server_onMelee(position, attacker, damage, power, direction, normal)
    print("Shape:server_onMelee()")
end

function Shape:server_onRemoved(player)
    print("Shape:server_onRemoved()")
end

function Shape:server_canErase()

end
--
function Shape:client_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("Shape:client_onCollision()")
end

function Shape:client_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("Shape:client_onProjectile()")
end

function Shape:client_onMelee(position, attacker, damage, power, direction, normal)
    print("Shape:client_onMelee()")
end

function Shape:client_canErase()

end

function Shape:client_onInteract(character, state)

end

function Shape:client_onInteractThroughJoint(character, state, joint)

end

function Shape:client_onTinker(character, state)

end

function Shape:client_canInteract(character)

end

function Shape:client_canInteractThroughJoint(character)

end

function Shape:client_canTinker(character)

end

function Shape:client_onAction(action, state)

end

function Shape:client_canCarry()

end

function Shape:client_getAvailableParentConnectionCount(flags)

end

function Shape:client_getAvailableChildConnectionCount(flags)

end
