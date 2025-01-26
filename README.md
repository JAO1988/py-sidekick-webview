# py-sidekick-webview
A simple set of bash scripts and Python webview used for running PoE2's Sidekick tool in a Linux Wayland session.

## Usage
The following files in this repository include:
- `sidekick-webview.py` - Used to execute the webview Sidekick web-hook 
- `sidekick-webview.sh` - A script using `wl-clipboard` to copy, encode, and paste market codes to Sidekick.

![](https://github.com/JAO1988/py-sidekick-webview/blob/main/images/sidekick-webview.gif)

A Sidekick initiliziation bash script, `sidekick-server.sh`, can found in the `server` folder.

## Prerequisites
Note: These packages pertain to Arch Linux and Arch-Based Distros:
```
wl-clipboard
dotnet-sdk-8.0
aspnet-runtime-8.0
npm
nodejs
python
python-pipx
```

## Sidekick Setup
1. Clone the Sidekick source from the following repository:
```
git pull https://github.com/Sidekick-Poe/Sidekick
```
2. Edit the .sln file by commenting (#) or removing the following lines:
```
#Project("{9A19103F-16F7-4668-BE54-9A1E7A4F7556}") = "Sidekick.Wpf", "src\Sidekick.Wpf\Sidekick.Wpf.csproj", "{0E8A5165-AFEE-42BB-9C96-EA288F613BDE}"
#EndProject
```
3. Open your terminal in the root directory of Sidekick: (i.e `./home/projects/Sidekick/`)
4. Run `dotnet build`
5. Clone this repo:
```
git pull https://github.com/JAO1988/py-sidekick-webview
```
6. Place `sidekick-webview.py` and `sidekick-webview.sh` in the `~./Sidekick/src/Sidekick.Web/` folder for ease of access.
7. Edit `sidekick-weview.sh` to match the appropriate `sidekick-webview.py` file location:
```
python ".dir/poe.py" "$url"
```
8. Run sidekick by executing the following command:
```
dotnet ./bin/Debug/net8.0/Sidekick.dll
```
Additionally, the `sidekick-server.sh` script can be copied to the `~./Sidekick/src/Sidekick.Web/` directory and ran.

## Script Shortcut (KDE)
You can add a shortcut command for `sidekick-webview.sh` in your settings as a custom hotkey toggle:
![](https://github.com/JAO1988/py-sidekick-webview/blob/main/images/kde-shortcut.png)

## In-Game
While Path of Exile 2 is running, copy an item using `ctrl+c` and then call the `sidekick-webview.py` script using your desired shortcut keybind. The contents of the clipboard will be copied and encoded as a base64 string within `wl-clipboard` before getting pasted into the URL contents of Sidekick.

## Additional Notes
The default webview window size can be adjusted under `webview.create_window('Sidekick', url, width=800, height=900, resizable=True)` in `sidekick-webview.py`. 

Testing of the script has been done in KDE, however other Wayland supported environments (GNOME, Cosmic, Hyprland, QTile) should be compatible.

## Thanks
- **Jeager - Big props for setting up the python parameters with webview**
- **[Sidekick](https://github.com/Sidekick-Poe/Sidekick) - Excellent work on a fantastic PoE2 Tool!**
