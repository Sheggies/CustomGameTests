print("World.lua loaded")

World = class(nil)
World.terrainScript = "$CONTENT_DATA/Scripts/terrain.lua"
World.cellMinX = -2
World.cellMaxX = 1
World.cellMinY = -2
World.cellMaxY = 1
World.worldBorder = true

function World:__init()
    print("World.ctor")
end

function World:server_onCreate()
    print("World:server_onCreate()")
end

function World:server_onDestroy()
    print("World:server_onDestroy()")
end

function World:server_onRefresh()

end

function World:server_onFixedUpdate(ts)

end
--
function World:client_onCreate()
    print("World:client_onCreate()")
end

function World:client_onDestroy()
    print("World:client_onDestroy()")
end

function World:client_onRefresh()

end

function World:client_onFixedUpdate(ts)

end

function World:client_onUpdate(ds)

end

function World:client_onClientDataUpdate(data, channel)

end

function World:client_onEvent(event, args)

end

-- Network callbacks

function World:net_server_callback(args, player)

end

function World:net_client_callback(args)

end

-- Event callbacks

function World:event_callback(event, args)

end

-- World callbacks

function World:server_onCellCreated(x, y)

end

function World:server_onCellLoaded(x, y)

end

function World:server_onCellUnloaded(x, y)

end

function World:server_onInteractableCreated(interactable)
    print("World:server_onInteractableCreated()")
end

function World:server_onInteractableDestroyed(interactable)
    print("World:server_onInteractableDestroyed()")
end

function World:server_onProjectile(position, airTime, velocity, projectileName, shooter, damage, customData, normal, target, uuid)
    print("World:server_onProjectile()")
    sm.event.sendToScriptableObject(_G.backpackMgr, "server_projectileHitWorld", { position = position, uuid = uuid, customData = customData, world = self.world })
end

function World:server_onExplosion(center, destructionLevel)
    print("World:server_onExplosion()")
end

function World:server_onMelee(position, attacker, damage, power, direction, normal)
    print("World:server_onMelee()")
end

function World:server_onProjectileFire(position, velocity, projectileName, shooter, uuid)
    print("World:server_onProjectileFire()")
    sm.event.sendToScriptableObject(_G.backpackMgr, "server_projectileFired", { shooter = shooter, projectileName = projectileName, uuid = uuid })
end

function World:server_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("World:server_onCollision()")
end
--
function World:client_onCellLoaded(x, y)

end

function World:client_onCellUnloaded(x, y)

end

function World:client_onCollision(other, position, pointVelocityA, pointVelocityB, normal)
    print("World:client_onCollision()")
end

-- Custom methods

function World:server_spawnHarvestable(args)
    local h = sm.harvestable.createHarvestable(args.uuid, args.position, args.rotation, args.slopeNormal)
    h:setPublicData(args.drop)
end
