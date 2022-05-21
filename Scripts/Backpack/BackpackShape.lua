print("BackpackShape.lua loaded")

BackpackShape = class()

function BackpackShape:__init()
    print("BackpackShape.ctor")
end

function BackpackShape:server_onCreate()
    print("BackpackShape:server_onCreate()")
    self.sv = {}
    self.sv.saved = self.storage:load() or { firstTimeSetup = true }

    if self.sv.saved.firstTimeSetup then
        self.sv.saved.firstTimeSetup = false
        self.interactable:addContainer(0, 30, 10)
        self.storage:save(self.sv.saved)
    end
end

function BackpackShape:server_onDestroy()
    print("BackpackShape:server_onDestroy()")
end

function BackpackShape:server_onRefresh()

end

function BackpackShape:server_onFixedUpdate(ts)

end
--
function BackpackShape:client_onCreate()
    print("BackpackShape:client_onCreate()")
end

function BackpackShape:client_onDestroy()
    print("BackpackShape:client_onDestroy()")
end

function BackpackShape:client_onRefresh()

end

function BackpackShape:client_onFixedUpdate(ts)

end

function BackpackShape:client_onUpdate(ds)

end

function BackpackShape:client_onClientDataUpdate(data, channel)

end

function BackpackShape:client_onEvent(event, args)

end

-- BackpackShape callbacks

function BackpackShape:server_onUnload()
    print("BackpackShape:server_onUnload()")
end

function BackpackShape:server_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("BackpackShape:server_onCollision()")
end

function BackpackShape:server_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("BackpackShape:server_onProjectile()")
end

function BackpackShape:server_onExplosion(center, destructionLevel)
    print("BackpackShape:server_onExplosion()")
end

function BackpackShape:server_onMelee(position, attacker, damage, power, direction, normal)
    print("BackpackShape:server_onMelee()")
end

function BackpackShape:server_onRemoved(player)
    print("BackpackShape:server_onRemoved()")
end

function BackpackShape:server_canErase()

end
--
function BackpackShape:client_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("BackpackShape:client_onCollision()")
end

function BackpackShape:client_onProjectile(position, airTime, velocity, projectileName, shoorter, damage, customData, normal, uuid)
    print("BackpackShape:client_onProjectile()")
end

function BackpackShape:client_onMelee(position, attacker, damage, power, direction, normal)
    print("BackpackShape:client_onMelee()")
end

function BackpackShape:client_canErase()

end

function BackpackShape:client_onInteract(character, state)

end

function BackpackShape:client_onInteractThroughJoint(character, state, joint)

end

function BackpackShape:client_onTinker(character, state)

end

function BackpackShape:client_canInteract(character)

end

function BackpackShape:client_canInteractThroughJoint(character)

end

function BackpackShape:client_canTinker(character)

end

function BackpackShape:client_onAction(action, state)

end

function BackpackShape:client_canCarry()

end
