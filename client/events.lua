--[[ Core Events ]]

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Wait(1000)
        Client.Functions.StartCore()
    end
end)
AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        Client.Functions.StopCore()
    end
end)
RegisterNetEvent(_e("Client:HandleCallback"), function(key, ...)
    if Client.Callbacks[key] then
        Client.Callbacks[key](...)
        Client.Callbacks[key] = nil
    end
end)

--[[ Custom Events ]]
