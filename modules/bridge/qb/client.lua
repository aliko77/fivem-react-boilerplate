--[[ Events ]]
RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    Client.Functions.StartCore()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    Client.Functions.OnPlayerLogout()
    Client.Functions.StopCore()
end)
