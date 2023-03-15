fx_version 'cerulean'
game 'gta5'

author 'AglioB'
version '1.3.3'

shared_scripts {
    'Shared/*.lua'
}

client_scripts {
    'Client/*.lua'
}

server_scripts {
    'Server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles.css',
    'html/main.js'
}

exports {"SendMText", "SendLog"}


lua54 'yes'
