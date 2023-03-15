
function sendLogs (message, webhook)
    if message == nil or message == '' then return false end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('ab-basic:SendLog', function(message, webhook)
    sendLogs(message , webhook)
end)
