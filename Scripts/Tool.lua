print("Tool.lua loaded")

Tool = class()

function Tool:server_onCreate()
    print("Tool:server_onCreate()")
end

function Tool:server_onDestroy()
    print("Tool:server_onDestroy()")
end

function Tool:server_onRefresh()

end

function Tool:server_onFixedUpdate(ts)

end
--
function Tool:client_onCreate()
    print("Tool:client_onCreate()")
end

function Tool:client_onDestroy()
    print("Tool:client_onDestroy()")
end

function Tool:client_onRefresh()

end

function Tool:client_onFixedUpdate(ts)

end

function Tool:client_onUpdate(dt)

end

function Tool:client_onClientDataUpdate(data, channel)

end

function Tool:client_onEvent(event, args)

end

-- Network callbacks

function Tool:net_server_callback(args, player)

end

function Tool:net_client_callback(args)

end

-- Event callbacks

function Tool:event_callback(event, args)

end

-- Tool callbacks

function Tool:client_onEquip(animate)
    print("Tool:client_onEquip()")
end

function Tool:client_onUnequip(animate)
    print("Tool:client_onUnequip()")
end

function Tool:client_onEquippedUpdate(primaryState, secondaryState)
    print("Tool:client_onEquippedUpdate()")
    return false, false
end

function Tool:client_onToggle()
    print("Tool:client_onToggle()")
    return false
end

function Tool:client_onReload()
    print("Tool:client_onReload()")
    return false
end

function Tool:client_canEquip()
    return true
end
