print("ScriptableObject.lua loaded")

ScriptableObject = class()

function ScriptableObject:server_onCreate()
    print("ScriptableObject:server_onCreate()")
end

function ScriptableObject:server_onDestroy()
    print("ScriptableObject:server_onDestroy()")
end

function ScriptableObject:server_onRefresh()

end

function ScriptableObject:server_onFixedUpdate(ts)

end
--
function ScriptableObject:client_onCreate()
    print("ScriptableObject:client_onCreate()")
end

function ScriptableObject:client_onDestroy()
    print("ScriptableObject:client_onDestroy()")
end

function ScriptableObject:client_onRefresh()

end

function ScriptableObject:client_onFixedUpdate(ts)

end

function ScriptableObject:client_onUpdate(ds)

end

function ScriptableObject:client_onClientDataUpdate(data, channel)

end

function ScriptableObject:client_onEvent(event, args)

end

-- Network callbacks

function ScriptableObject:net_server_callback(args, player)

end

function ScriptableObject:net_client_callback(args)

end

-- Event callbacks

function ScriptableObject:event_callback(event, args)

end
