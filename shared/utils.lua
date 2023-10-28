Utils = {}
--- Prints the contents of a table with optional indentation.
---
--- @param table (table) The table to be printed.
--- @param indent? (number, optional) The level of indentation for formatting.
Utils.printTable = function(table, indent)
    indent = indent or 0
    if type(table) == 'table' then
        for k, v in pairs(table) do
            local tblType = type(v)
            local formatting = ("%s ^3%s:^0"):format(string.rep("  ", indent), k)
            if tblType == "table" then
                print(formatting)
                Utils.printTable(v, indent + 1)
            elseif tblType == 'boolean' then
                print(("%s^1 %s ^0"):format(formatting, v))
            elseif tblType == "function" then
                print(("%s^9 %s ^0"):format(formatting, v))
            elseif tblType == 'number' then
                print(("%s^5 %s ^0"):format(formatting, v))
            elseif tblType == 'string' then
                print(("%s ^2'%s' ^0"):format(formatting, v))
            else
                print(("%s^2 %s ^0"):format(formatting, v))
            end
        end
    else
        print(("%s ^0%s"):format(string.rep("  ", indent), tbl))
    end
end

---@param name string resource name
---@return boolean
Utils.hasResource = function(name)
    return GetResourceState(name):find("start") ~= nil
end

--- A simple debug print function that is dependent on a convar
--- will output a nice prettfied message if debugMode is on
Utils.debugPrint = function(tbl, indent)
    if not Config.DebugPrint then return end
    print(('\x1b[4m\x1b[36m[ %s : DEBUG]\x1b[0m'):format(GetInvokingResource() or "-a"))
    Utils.printTable(tbl, indent)
    print('\x1b[4m\x1b[36m[ END DEBUG ]\x1b[0m')
end

---@param source number | nil Player server id or nil, if value is nil, Trigger client event.
---@param title string
---@param type "error" | "success" | "info" | any
---@param text string
---@param duration number miliseconds
Utils.CustomNotify = function(source, title, type, text, duration, icon)
    if source and source > 0 then -- Server Notify
        -- TriggerClientEvent("EventName", source, ?, ?, ?, ?)
    else                          -- Client Notify
        -- exports["ExportName"]:Alert(?, ?, ?, ?)
    end
end

--
--- Get framework used by the server
--- @return object
Utils.GetFramework = function()
    if Config.FrameWork == "qb" then
        return exports["qb-core"]:GetCoreObject()
    elseif Config.FrameWork == "esx" then
        return exports["es_extended"]:getSharedObject()
    end
end
