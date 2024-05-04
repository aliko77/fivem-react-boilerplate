-- [[ Core Events ]]

RegisterNetEvent(_e("Server:HandleCallback"), function(key, ...)
    local src = source
    if Server.Callbacks[key] then
        Server.Callbacks[key](src, function(...)
            TriggerClientEvent(_e("Client:HandleCallback"), src, key, ...)
        end, ...)
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        -- ?
    end
end)

AddEventHandler("playerDropped", function()
    local src = source
    -- ?
end)

--[[ Custom Events ]]
