--<!>-- QUITAR ITEMS --<!>--
RegisterNetEvent('ab-basics:server:RemoveItem', function(itemremove, amount)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(itemremove, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemremove], 'remove')
    end
end)


--<!>-- DAR ITEMS --<!>--
RegisterNetEvent('ab-basics:server:AddItem', function(itemadd, amount)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.AddItem(itemadd, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemadd], 'add')
    end
end)

--<!>-- COBRAR DINERO --<!>--
RegisterNetEvent("ab-basics:server:billPlayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)

    if billed ~= nil then
        if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
            if amount and amount > 0 then
                MySQL.Async.execute('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                    ['@citizenid'] = billed.PlayerData.citizenid,
                    ['@amount'] = amount,
                    ['@society'] = biller.PlayerData.job.name,
                    ['@sender'] = biller.PlayerData.charinfo.firstname,
                    ['@sendercitizenid'] = biller.PlayerData.citizenid
                })
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'Recibiste una factura')
                
            else
                TriggerClientEvent('QBCore:Notify', source, 'Pon un numero mayor a 0', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No puedes cobrarte a ti mismo...', 'error')
            
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'Este jugador no esta en linea', 'error')
    end
end)