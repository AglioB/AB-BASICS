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

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles.css',
    'html/main.js'
}

exports {"SendMText"}


lua54 'yes'
