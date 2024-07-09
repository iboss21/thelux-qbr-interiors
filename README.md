# TheLux-QBR-Interiors

![License](https://img.shields.io/badge/license-MIT-blue.svg)

A simple resource for RedM using QBCore to open or close all interiors in the game. This resource includes the necessary logic, functions, events, and exports to manage the state of interiors.

## Features

- Automatically open or close all interiors on resource start
- Toggle interiors with an in-game command
- Event-based toggle for integration with other scripts
- Export function for easy integration in other resources

## Prerequisites

- RedM server
- QBCore framework
- Alexander Blade's ScriptHookRDR2

## Installation

1. Install Alexander Blade's ScriptHookRDR2 if you haven't already.

2. Download the latest release from the [releases page](https://github.com/yourusername/TheLux-QBR-Interiors/releases).

3. Extract the `thelux-qbr-interiors` folder into your RedM server's `resources` directory.

4. Add the following line to your `server.cfg`:

ensure thelux-qbr-interiors

5. (Optional) Configure the initial state of interiors in `config.lua`.

6. Restart your RedM server.

## Configuration

You can configure the initial state of interiors by editing the `config.lua` file:

Config = {}

-- Set to true to open all interiors, false to close all interiors
Config.OpenInteriors = true

Usage
Automatic Toggle
The interiors will automatically open or close based on the initial configuration in config.lua when the resource starts.

Manual Toggle

Use the /toggleinteriors command in-game to toggle all interiors open or closed.

Event Trigger
Trigger the thelux-qbr-interiors:toggle event from other scripts to toggle the interiors:

```lua
TriggerEvent('thelux-qbr-interiors:toggle')
```
Export Function
Use the export function to toggle interiors from other resources:

```lua
Export Function
Use the export function to toggle interiors from other resources:
```
Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

Fork the project
Create your feature branch (git checkout -b feature/AmazingFeature)
Commit your changes (git commit -m 'Add some AmazingFeature')
Push to the branch (git push origin feature/AmazingFeature)
Open a Pull Request

License
This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

QBCore team for the amazing framework
RedM community for their continuous support

Support
If you need help or find a bug, please open an issue.

Made with ❤️ by TheLuxEmpire - iBoss21
