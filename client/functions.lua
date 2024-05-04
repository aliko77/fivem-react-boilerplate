--[[ Koci ]]
Client = {
    Callbacks = {},
    Functions = {},
    CreatedTargets = {},
    CreatedObjects = {},
    Player = {
        --?
    },
}

--[[ Core Functions ]]

function Client.Functions.TriggerServerCallback(key, callback, ...)
    callback = callback or function() end
    Client.Callbacks[key] = callback
    local event = _e("Server:HandleCallback")
    TriggerServerEvent(event, key, ...)
end

function Client.Functions.SendReactMessage(action, data)
    SendNUIMessage({ action = action, data = data })
end

function Client.Functions.SendNotify(title, type, duration, icon, text)
    Resmon.Lib.ShowNotify(title, type, duration, icon, text)
end

function Client.Functions.GetPlayerData()
    return Resmon.Lib.GetPlayerData()
end

function Client.Functions.IsPlayerLoaded()
    return Resmon.Lib.IsPlayerLoaded()
end

--[[ Script Functions ]]

function Client.Functions.AddTargetModel(key, type, models, options, onSelect)
    local targetId = models
    local icon = options.icon
    local label = options.label
    if Config.TargetType == "ox_target" then
        exports.ox_target:addModel(models, { {
            icon = icon,
            label = label,
            onSelect = onSelect,
            distance = 2.0,
        } })
    elseif Config.TargetType == "qb_target" then
        exports["qb-target"]:AddTargetModel(models,
            {
                options = {
                    {
                        icon = icon,
                        label = label,
                        action = onSelect,
                    },
                },
                distance = 2.0,
            })
    else
        Utils.Functions.CustomTarget.AddTargetModel(models, {
            icon = icon,
            label = label,
        }, onSelect)
    end
    table.insert(Client.CreatedTargets, {
        id = targetId,
        key = key,
        type = type
    })
end

function Client.Functions.RemoveTarget(id)
    if Config.TargetType == "ox_target" then
        exports.ox_target:removeModel(id)
    elseif Config.TargetType == "qb_target" then
        exports["qb-target"]:RemoveTargetModel(id)
    else
        Utils.Functions.CustomTarget.RemoveTargetModel(id)
    end
end

function Client.Functions.DeleteTargets()
    local entities = Client.CreatedTargets
    for _, value in pairs(entities) do
        Client.Functions.RemoveTarget(value.id)
    end
    Client.CreatedTargets = {}
end

function Client.Functions.DeleteObjects()
    for _, value in pairs(Client.CreatedObjects) do
        if value.objectId and DoesEntityExist(value.objectId) then
            DeleteEntity(value.objectId)
        end
    end
    Client.CreatedObjects = {}
end

function Client.Functions.SetupUI()
    -- ?
end

function Client.Functions.OnPlayerLogout()
    TriggerServerEvent(_e("Server:OnPlayerLogout"))
end

-- @ --

function Client.Functions.StartCore()
    Client.Functions.SetupUI()
end

function Client.Functions.StopCore()
    Client.Functions.DeleteTargets()
    Client.Functions.DeleteObjects()
    -- @ --
    Client.Player = {
        --?
    }
end
