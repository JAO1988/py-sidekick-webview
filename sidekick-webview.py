import sys
import webview

if len(sys.argv) > 1:
    url = sys.argv[1]
else:
    url = 'http://localhost:5000/'

webview.create_window('Sidekick', url, width=800, height=900, resizable=True)
webview.start()
