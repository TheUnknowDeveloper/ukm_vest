fx_version 'cerulean'
games { 'gta5' }

author 'Kxinmensch'
description 'Warnweste System v2'
lua54 'yes'
version '2.0.0'


client_scripts {
	'config.lua',
	'client/client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/server.lua',
}

escrow_ignore {
	'config.lua',
  }


