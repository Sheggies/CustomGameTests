print("Character.lua loaded")

Character = class()

function Character:__init()
    print("Character.ctor")
end

-- Base class callbacks

function Character:server_onCreate()
    print("Character:server_onCreate()")
end

function Character:server_onDestroy()
    print("Character:server_onDestroy()")
end

function Character:server_onRefresh()

end

function Character:server_onFixedUpdate(ts)

end
--
function Character:client_onCreate()
    print("Character:client_onCreate()")
end

function Character:client_onDestroy()
    print("Character:client_onDestroy()")
end

function Character:client_onRefresh()

end

function Character:client_onFixedUpdate(ts)

end

function Character:client_onUpdate(dt)

end

function Character:client_onClientDataUpdate(data, channel)

end

-- Network callbacks

function Character:net_server_callback(args, player)

end

function Character:net_client_callback(args)

end

-- Event callbacks

function Character:event_callback(event, args)

end

-- Character callbacks

function Character:client_onProjectile(position, airTime, velocity, projectileName, shooter, damage, customData, normal, uuid)
    print("Character:client_onProjectile()")
end

function Character:client_onMelee(position, attacker, damage, power, direction, normal)
    print("Character:client_onMelee()")
end

function Character:client_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("Character:client_onCollision()")
end

function Character:client_onGraphicsLoaded()
    print("Character:client_onGraphicsLoaded()")
end

function Character:client_onGraphicsUnloaded()
    print("Character:client_onGraphicsUnloaded()")
end

function Character:client_onInteract(character, state)
    print("Character:client_onInteract()")
end

function Character:client_canInteract(character)
    print("Character:client_canInteract()")
end

function Character:client_onEvent(event, args)
    -- This is apparently called *every* time an event is sent with sm.event.sendToCharacter() regardless of the eventname passed I suppose
end
