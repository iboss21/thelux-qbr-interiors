local function toggleInteriors(open)
    local interiorIds = {
        -- Example interior IDs (replace with actual IDs as you discover them)
        24641, -- Valentine Saloon
        24642, -- Valentine Sheriff Office
        24643, -- Valentine Gunsmith
        26112, -- Saint Denis Bank
        27456, -- Rhodes Saloon
        28704, -- Annesburg Mine
        -- Add more interior IDs here as you discover them
    }

    for _, interiorId in ipairs(interiorIds) do
        if open then
            -- Function to open the interior
            ActivateInteriorEntitySet(interiorId, "default")
        else
            -- Function to close the interior
            DeactivateInteriorEntitySet(interiorId, "default")
        end
        RefreshInterior(interiorId)
    end
end

CreateThread(function()
    local open = Config.OpenInteriors
    toggleInteriors(open)  -- Toggle interiors based on config on script start
end)

RegisterCommand('toggleinteriors', function(source, args, rawCommand)
    Config.OpenInteriors = not Config.OpenInteriors
    toggleInteriors(Config.OpenInteriors)
    local status = Config.OpenInteriors and "opened" or "closed"
    print("Interiors are now " .. status)
end, false)

RegisterNetEvent('thelux-qbr-interiors:toggle')
AddEventHandler('thelux-qbr-interiors:toggle', function()
    Config.OpenInteriors = not Config.OpenInteriors
    toggleInteriors(Config.OpenInteriors)
    local status = Config.OpenInteriors and "opened" or "closed"
    print("Interiors are now " .. status)
end)

exports('ToggleInteriors', function()
    Config.OpenInteriors = not Config.OpenInteriors
    toggleInteriors(Config.OpenInteriors)
    return Config.OpenInteriors
end)
