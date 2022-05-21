print("BackpackTool.lua loaded")

BackpackTool = class()
BackpackTool.backpackShape = nil
BackpackTool.sv = nil
BackpackTool.cl = nil

function BackpackTool:__init()
    print("BackpackTool.ctor")
end

function BackpackTool:server_onCreate()
    print("BackpackTool:server_onCreate()")
    self.sv = {}
    self.sv.saved = self.storage:load() or {
        firstTimeSetup = true,
        backpackShape = sm.shape.createPart(sm.uuid.new("5b1cef4a-784b-4bb0-a876-60d56d928fdb"), sm.vec3.new(0, 0, -1000), sm.quat.identity(), false, true)
    }

    if self.sv.saved.firstTimeSetup then
        self.sv.saved.firstTimeSetup = false
        self.storage:save(self.sv.saved)
        sm.event.sendToScriptableObject(_G.backpackMgr, "server_registerBackpack", { tool = self.tool, shape = self.sv.saved.backpackShape })
    end

    self.network:sendToClient(self.tool:getOwner(), "client_setBackpackShape", self.sv.saved.backpackShape)
    print(self.tool)
end

function BackpackTool:server_onDestroy()
    print("BackpackTool:server_onDestroy()")
end

function BackpackTool:server_onRefresh()

end

function BackpackTool:server_onFixedUpdate(ts)

end
--
function BackpackTool:client_onCreate()
    print("BackpackTool:client_onCreate()")
    self.cl = {}
end

function BackpackTool:client_onDestroy()
    print("BackpackTool:client_onDestroy()")
end

function BackpackTool:client_onRefresh()

end

function BackpackTool:client_onFixedUpdate(ts)

end

function BackpackTool:client_onUpdate(dt)

end

function BackpackTool:client_onClientDataUpdate(data, channel)

end

function BackpackTool:client_onEvent(event, args)

end

-- BackpackTool callbacks

function BackpackTool:client_onEquip(animate)
    print("BackpackTool:client_onEquip()")
end

function BackpackTool:client_onUnequip(animate)
    print("BackpackTool:client_onUnequip()")
end

function BackpackTool:client_onEquippedUpdate(primaryState, secondaryState)
    --print("BackpackTool:client_onEquippedUpdate()")
    return false, false
end

function BackpackTool:client_onToggle()
    print("BackpackTool:client_onToggle()")

    local gui = sm.gui.createContainerGui(true)
    gui:setContainer("UpperGrid", self.cl.backpackShape.interactable:getContainer(0))
    gui:setContainer("LowerGrid", sm.localPlayer.getInventory())
    gui:setText("UpperName", "#{CONTAINER_TITLE_GENERIC}")
    gui:setText("LowerName", "#{INVENTORY_TITLE}")
    gui:open()

    return true
end

function BackpackTool:client_onReload()
    print("BackpackTool:client_onReload()")
    return false
end

function BackpackTool:client_canEquip()
    return true
end

-- Custom functions

function BackpackTool:client_setBackpackShape(shape)
    self.cl.backpackShape = shape
end
