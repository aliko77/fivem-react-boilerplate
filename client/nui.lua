RegisterNUICallback("nui:hideFrame", function(data, cb)
    SetNuiFocus(false, false)
    if not data then
        Client.Functions.SendReactMessage("ui:setVisible", false)
    end
    cb(true)
end)
