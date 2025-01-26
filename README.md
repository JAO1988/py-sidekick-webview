# py-sidekick-webview
Simple set of scripts for running a Python Webview hook of PoE2's Sidekick tool in a Linux Wayland session.

## Usage
The following files in this repository include `sidekick-webview.py` used to execute the webview Sidekick web-hook and `sidekick-webview.sh` which is a call script using `wl-clipboard` to copy, encode, and paste market codes to Sidekick.

![](https://github.com/JAO1988/py-sidekick-webview/blob/main/images/sidekick-webview.gif)

A simple server bash script, `sidekick-server.sh` can be found in the `server` folder for Sidekick server initiliziation.

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
6. Place 'sidekick-webview.py' and 'sidekick-webview.sh' in the `~./Sidekick/src/Sidekick.Web/` folder for ease of access.
7. Edit 'sidekick-weview.sh' to match the appropriate `sidekick-webview.py` file location:
```
python ".dir/poe.py" "$url"
```
8. Run sidekick by executing the following command:
```
dotnet ./bin/Debug/net8.0/Sidekick.dll
```
Additionally, the 'sidekick-server.sh' script can be copied to the `~./Sidekick/src/Sidekick.Web/` directory and ran.
