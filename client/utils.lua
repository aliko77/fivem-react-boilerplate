--- A simple wrapper around SendNUIMessage that you can use to
--- dispatch actions to the React frame.
---
---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

---@param system ("esx_notify" | "qb_notify" | "custom_notify") System to be used
---@param type string inform / success / error
---@param title string Notification text
---@param text? string (optional) description, custom notify.
---@param duration? number (optional) Duration in miliseconds, custom notify.
---@param icon? string (optional) icon.
function SendNotify(title, type, duration, icon, text)
    system = Config.NotifyType
    if system == "esx_notify" then
        if Config.FrameWork == "esx" then
            Koci.ShowNotification(title, type, duration)
        end
    elseif system == "qb_notify" then
        if Config.FrameWork == "esx" then
            Koci.Functions.Notify(title, type)
        end
    elseif system == "custom_notify" then
        Utils.CustomNotify(nil, title, type, text, duration, icon)
    end
end
