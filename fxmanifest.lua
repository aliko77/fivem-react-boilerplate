fx_version "cerulean"
game "gta5"
author "aliko. <Discord: aliko.>"
description "Fivem Script: -- ?"
version "1.0.0"
lua54 "yes"

shared_scripts {
    "shared/**/*"
}

client_scripts {
    "client/utils.lua",
    "client/variables.lua",
    "client/functions.lua",
    "client/events.lua",
    "client/nui.lua",
    "client/threads.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/utils.lua",
    "server/variables.lua",
    "server/functions.lua",
    "server/callbacks.lua",
    "server/commands.lua",
    "server/events.lua",
    "server/threads.lua"
}

ui_page "ui/build/index.html"

files {
    "locales/**/*",
    "ui/build/index.html",
    "ui/build/**/*"
}

escrow_ignore {
    "locales/**/*",
    "shared/config.lua",
    "client/variables.lua",
    "client/utils.lua",
    "server/variables.lua",
    "server/utils.lua",
    "server/commands.lua",
    "ui/build/**/*",
    "ui/public/**/*"
}
