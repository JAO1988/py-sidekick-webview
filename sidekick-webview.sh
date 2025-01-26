#!/bin/bash

item=$(wl-paste) ## Pull DE/WM clipboard content to Wayland clipboard (wl-clipboard)
sleep 0.1
new_clip=$(wl-paste)
script_dir="$(dirname "$(readlink -f "$0")")"

item64=$(echo -n "$new_clip" | base64) ## Encode and paste copied base64 item in Sidekick Market URL
url="http://localhost:5000/trade/xurl_${item64}"
sleep 0.1
python ".dir/poe.py" "$url" ## Point to the directory where Sidekick Webview script is located

echo -n "$item" | wl-copy ## Restore original item name in text-string format
