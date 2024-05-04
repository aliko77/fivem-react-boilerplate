fx_version "cerulean"
lua54 "yes"
game "gta5"
name "--?"
author "0Resmon | aliko."
version "1.0.0"
description "Fivem, --? script | 0resmon | aliko.<Discord>"

shared_scripts {
	"@ox_lib/init.lua",
	"shared/**/*"
}

client_scripts {
	"client/utils.lua",
	"client/functions.lua",
	"client/events.lua",
	"client/nui.lua",
	"client/threads.lua",
	"modules/bridge/**/client.lua",
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"server/utils.lua",
	"server/functions.lua",
	"server/events.lua",
	"server/commands.lua",
	"modules/bridge/**/server.lua",
}

ui_page "ui/build/index.html"

files {
	"locales/**/*",
	"ui/build/index.html",
	"ui/build/**/*",
}

dependencies {
	"0r_lib"
}

escrow_ignore {
	"client/**/*",
	"locales/**/*",
	"server/**/*",
	"shared/**/*",
	"modules/**/*"
}
