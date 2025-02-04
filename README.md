# py-sidekick-webview
A simple set of bash scripts and Python webview used for running PoE2's Sidekick tool in a Linux Wayland session.

## Usage
The following files in this repository include:
- `sidekick-webview.py` - Used to execute the webview Sidekick web-hook.
- `sidekick-webview.sh` - A script using `wl-clipboard` to copy, encode, and paste market codes to Sidekick.

![](https://github.com/JAO1988/py-sidekick-webview/blob/main/images/sidekick-webview.gif)

A Sidekick initiliziation bash script, `sidekick-server.sh`, can found in the `server` folder.

## Prerequisites
Note: These packages pertain to Arch Linux and Arch-Based Distros:
```
aspnet-runtime-8.0
dotnet-sdk-8.0
nodejs
npm
python
python-pipx
python-pywebview
webviewer
wl-clipboard
```

## Sidekick & py-sidekick-webview Setup
1. Clone Sidekick from it's respective repository:
```
git pull https://github.com/Sidekick-Poe/Sidekick
```
2. Navigate to Sidekick's root folder and edit `Sidekick.sln` by commenting (#) or removing the following lines:
```
#Project("{9A19103F-16F7-4668-BE54-9A1E7A4F7556}") = "Sidekick.Wpf", "src\Sidekick.Wpf\Sidekick.Wpf.csproj", "{0E8A5165-AFEE-42BB-9C96-EA288F613BDE}"
#EndProject
```
3. Open your terminal in the root directory of Sidekick: (i.e `./home/projects/Sidekick/`)
4. Run `dotnet build`
5. Clone this repository:
```
git pull https://github.com/JAO1988/py-sidekick-webview
```
6. Copy `sidekick-webview.py` and `sidekick-webview.sh` to `~./Sidekick/src/Sidekick.Web/`.
7. Edit `sidekick-weview.sh` to match the appropriate `sidekick-webview.py` file location:
```
python ".dir/sidekick-webview.py" "$url"
```
8. Run sidekick by executing the following command:
```
dotnet ./bin/Debug/net8.0/Sidekick.dll
```
ALternatively, `sidekick-server.sh` can be copied to `~./Sidekick/src/Sidekick.Web/` and ran to execute `Sidekick.dll`.

## Docker Container Setup
If you've built Sidekick in a Docker container, edit `sidekick-webview.py` and `sidekick-webview.sh` to match the appropriate container address replacing `http://localhost:5000/`:
```
if len(sys.argv) > 1:
    url = sys.argv[1]
else:
    url = '**http://XXX.XXX.XXX.XXX:5000**'

item64=$(echo -n "$new_clip" | base64)
url="**http://XXX.XXX.XXX.XXX:5000**/trade/xurl_${item64}"
sleep 0.1
```

## Script Shortcut (KDE)
You can add a shortcut command for `sidekick-webview.sh` in Settings as a custom hotkey toggle:
![](https://github.com/JAO1988/py-sidekick-webview/blob/main/images/kde-shortcut.png)

## In-Game
While Path of Exile 2 is running, copy an item using `ctrl+c` and then call the `sidekick-webview.sh` script using your desired shortcut keybind. The contents of the clipboard will be copied and encoded as a base64 string within `wl-clipboard` before getting pasted into the URL contents of Sidekick.

## Additional Notes
The default webview window size can be adjusted under `webview.create_window('Sidekick', url, width=800, height=900, resizable=True)` in `sidekick-webview.py`. 

Testing of the script has been done in KDE, however other Wayland supported environments (GNOME, Cosmic, Hyprland, QTile) should be compatible.

## Thanks
- **Jeager - Big props for setting up the python parameters with webview**
- **[Sidekick](https://github.com/Sidekick-Poe/Sidekick) - Excellent work on a fantastic PoE2 Tool!**
