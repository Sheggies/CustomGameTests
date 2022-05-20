Base = class() -- Basically a scriptable object according to comparisons with the official docs

function Base:server_onCreate()

end

function Base:server_onDestroy()

end

function Base:server_onRefresh()

end

function Base:server_onFixedUpdate(ts)

end
--
function Base:client_onCreate()

end

function Base:client_onDestroy()

end

function Base:client_onRefresh()

end

function Base:client_onFixedUpdate(ts)

end

function Base:client_onUpdate(dt)

end

function Base:client_onClientDataUpdate(data, channel)

end

function Base:client_onEvent(event, args)

end

-- Network callbacks

function Base:net_server_callback(args, player)

end

function Base:net_client_callback(args)

end

-- Event callbacks

function Base:event_callback(event, args)

end
