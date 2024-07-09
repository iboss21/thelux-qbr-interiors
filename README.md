# TheLux-QBR-Interiors

A simple resource for RedM using QBCore to open or close all interiors in the game. This resource includes the necessary logic, functions, events, and exports to manage the state of interiors.

## Installation

1. **Install Alexander Blade's ScriptHookRDR2**
2. **Download and Extract the Resource**
   - Extract the resource into your RedM server's `resources` directory.
3. **Configure the Resource**
   - Edit the `config.lua` file to set the initial state of interiors (open or closed).
4. **Add Resource to Server Configuration**
   - Add `ensure thelux-qbr-interiors` to your `server.cfg`.

## Files

### fxmanifest.lua

```lua
fx_version 'adamant'
game 'rdr3'

author 'TheLux'
description 'A simple resource to open or close all interiors in RedM using QBCore'
version '1.0.0'

client_script {
    'config.lua',
    'client.lua'
}
config.lua
```

```lua
Config = {}

-- Set to true to open all interiors, false to close all interiors
Config.OpenInteriors = true
client.lua
lua
Copy code
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
```
Usage
Automatic Toggle
The interiors will automatically open or close based on the initial configuration in config.lua.
Manual Toggle
Use the /toggleinteriors command in-game to toggle the interiors open or closed.
Event Trigger
Trigger the event thelux-qbr-interiors:toggle from other scripts to toggle the interiors.
Export Function
Use the export function exports['thelux-qbr-interiors']:ToggleInteriors() to toggle interiors from other resources.
Contribution
Feel free to contribute by opening issues or submitting pull requests to enhance the functionality of this resource.

License
This project is licensed under the MIT License. See the LICENSE file for more details.
