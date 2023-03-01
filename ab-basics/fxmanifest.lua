fx_version 'cerulean'
game 'gta5'

author 'AglioB'
version '1.3.2'

shared_scripts {
    'Shared/*.lua'
}

client_scripts {
    'Client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'Server/*.lua'
}

escrow_ignore {
    'Shared/*.lua'
}

dependencies {
    'qb-core',
    -- 'qb-menu',
    -- 'qb-input',
    -- 'PolyZone',
    -- 'progressbar',
    -- 'ps-ui'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles.css',
    'html/main.js'
}

exports {"SendMText"}


lua54 'yes'
