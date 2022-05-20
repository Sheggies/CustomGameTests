print("Unit.lua loaded")

Unit = class()

function Unit:__init()
    print("Unit.ctor")
end

function Unit:server_onCreate()
    print("Unit:server_onCreate()")
end

function Unit:server_onDestroy()
    print("Unit:server_onDestroy()")
end

function Unit:server_onRefresh()

end

function Unit:server_onFixedUpdate(ts)

end
--
function Unit:client_onCreate()
    print("Unit:client_onCreate()")
end

function Unit:client_onDestroy()
    print("Unit:client_onDestroy()")
end

function Unit:client_onRefresh()

end

function Unit:client_onFixedUpdate(ts)

end

function Unit:client_onUpdate(dt)

end

function Unit:client_onClientDataUpdate(data, channel)

end

function Unit:client_onEvent(event, args)

end

-- Network callbacks

function Unit:net_server_callback(args, player)

end

function Unit:net_client_callback(args)

end

-- Event callbacks

function Unit:event_callback(event, args)

end

-- Unit callbacks

function Unit:server_onProjectile(position, airTime, velocity, projectileName, shooter, damage, customData, normal, uuid)
    print("Unit:server_onProjectile()")
end

function Unit:server_onExplosion(center, destructionLevel)
    print("Unit:server_onExplosion()")
end

function Unit:server_onMelee(position, attacker, damage, power, direction, normal)
    print("Unit:server_onMelee()")
end

function Unit:server_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("Unit:server_onCollision()")
end

function Unit:server_onCollisionCrush()
    print("Unit:server_onCollisionCrush()")
end

function Unit:server_onUnitUpdate(dt)
    print("Unit:server_onUnitUpdate()")
end

function Unit:server_onCharacterChangedColor(colour)

end
