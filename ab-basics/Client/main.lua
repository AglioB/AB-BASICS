
--<!>-- ANUNCIO EN PANTALLA --<!>--

announcestring = false
TimeToRemove = Config.TimeToRemoveAnnounceDefault

announcestring = false
announceTitle = false

RegisterNetEvent('ab-basics:client:announce', function (title, msg, time)
    if time ~= nil or tonumber(time) == 0 then
        TimeToRemove = tonumber(time)
    end
    	announcestring = msg
        announceTitle = title 
	PlaySoundFrontend(-1, "DELETE","HUD_DEATHMATCH_SOUNDSET", 1)
	Citizen.Wait(TimeToRemove * 1000)
	announcestring = false
    announceTitle = false
end)

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~y~"..announceTitle)
    PushScaleformMovieFunctionParameterString(announcestring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end


Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
    if announcestring then
		scaleform = Initialize("mp_big_message_freemode")
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
end
end)




--<!>-- SACAR AUTO --<!>--
RegisterNetEvent('ab-basics:client:GiveCar', function(model, coords)
    local ModelHash = model
    local player = PlayerPedId()
    local pos = GetEntityCoords(player)
    if coords ~= '' or coords ~= nil then
        pos = coords
    end
    RequestModel(ModelHash) 
    local vehicle = CreateVehicle(ModelHash , pos , GetEntityHeading(player), true, false)
    -- if IsPedInAnyVehicle(player, false) then
    --     DeleteVehicle(GetVehiclePedIsIn(player)) --Borrar Auto 
    --     Wait(100)
    -- end
    TaskWarpPedIntoVehicle(player, vehicle, -1)
end)



--<!>-- TEXTO EN PANTALLA (NATIVA) --<!>--

RegisterNetEvent('ab-basics:client:MissionText')
AddEventHandler('ab-basics:client:MissionText', function(text, time)
        ClearPrints()
        SetTextEntry_2("STRING")
        AddTextComponentString(text)
        DrawSubtitleTimed(time, 1)
end)


--<!>-- TEXTO EN PANTALLA EN UNA BOX--<!>--

function SendMText(action, title, text, position)
    SendNUIMessage({
        action = action;
        title = title;
        text = text;
        position = position;
    })
end

exports('SendMText', function(action, title, text, position)
    SendNUIMessage({
        action = action;
        title = title;
        text = text;
        position = position;
    })
end)

RegisterNetEvent('ab-basics:client:SendMText', function (action, title, text, position)
    SendNUIMessage({
        action = action;
        title = title;
        text = text;
        position = position;
    })
end)


RegisterCommand('testeo', function ()
    exports['ab-basics']:SendMText("show", "Titulo: ", "TEXTOOOOOOOO", "bottomCenter")
    Wait(5000)
    exports['ab-basics']:SendMText("hide")
end)
