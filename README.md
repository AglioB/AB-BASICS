

## Client Side

# MOSTRAR TEXTO EN PANTALLA EN UNA BOX #

exports['ab-basics']:sendMText("show/hide", "TITLE: ", "TEXT", "topRight / topLeft / topCenter / bottomLeft / bottomRight / bottomCenter")

TriggerEvent('ab-basics:client:SendMText', "show/hide", "TITLE: ", "TEXT", "POSITION")

# MOSTRAR TEXTO DE MISION NATIVO #

TriggerEvent('ab-basics:client:MissionText', text, time)

## Server Side

# MOSTRAR TEXTO EN PANTALLA EN UNA BOX #

TriggerClientEvent('ab-basics:client:SendMText', source, "show/hide", "TITLE: ", "TEXT", "POSITION")

# MOSTRAR TEXTO DE MISION NATIVO #

TriggerClientEvent('ab-basics:client:MissionText', source, text, time)


## THIS SCRIPT IS IN CONSTANTLY UPDATES ##
