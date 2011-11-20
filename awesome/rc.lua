require("awful")
require("awful.autofocus")
require("naughty")
require("shifty")
require("scratch")
require("theme")
print("Entered rc.lua: " .. os.time())

terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"
lock = "xlock"

modkey = "Mod4"

require("tags")
require("wiboxes")
require("bindings")
require("signals")

shifty.taglist = mytaglist
shifty.init()
root.keys(globalkeys)
shifty.config.clientkeys = clientkeys
shifty.config.globalkeys = globalkeys
shifty.config.modkey = modkey

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
