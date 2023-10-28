--- Function that executes database queries
---
--- @param query: The SQL query to execute
--- @param params: Parameters for the SQL query (in table form)
--- @param type ("insert" | "update" | "query" | "scalar" | "single" | "prepare"): Parameters for the SQL query (in table form)
--- @return query any Results of the SQL query
function ExecuteSQLQuery(query, params, type)
    if type == "insert" then
        return MySQL.insert.await(query, params)
    elseif type == "update" then
        return MySQL.update.await(query, params)
    elseif type == "query" then
        return MySQL.query.await(query, params)
    elseif type == "scalar" then
        return MySQL.scalar.await(query, params)
    elseif type == "single" then
        return MySQL.single.await(query, params)
    elseif type == "prepare" then
        return MySQL.prepare.await(query, params)
    else
        error("Invalid queryType: " .. tostring(type or "?"))
    end
end

---@param system ("esx_notify" | "qb_notify" | "custom_notify") System to be used
---@param source number Player source id
---@param type string inform / success / error
---@param title string Notification text
---@param text? string (optional) description, custom notify.
---@param duration? number (optional) Duration in miliseconds, custom notify.
---@param icon? string (optional) icon.
function SendNotifyServerside(source, type, title, text, duration, icon)
    system = Config.NotifyType
    if not duration then duration = 1000 end
    if system == "qb_notify" then
        if Config.FrameWork == "qb" then
            TriggerClientEvent("QBCore:Notify", source, title, type)
        else
            Utils.debugPrint("error", "QB not found.")
        end
    elseif system == "esx_notify" then
        if Config.FrameWork == "esx" then
            TriggerClientEvent("esx:showNotification", source, title, type, duration)
        else
            Utils.debugPrint("error", "ESX not found.")
        end
    elseif system == "custom_notify" then
        Utils.CustomNotify(source, title, type, text, duration, icon)
    else
        Utils.debugPrint("error", "An error occurred.")
    end
end
