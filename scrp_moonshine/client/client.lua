local money = math.random(Config.money['min'], Config.money['max'])
local xp = math.random(Config.xp['min'], Config.xp['max'])
local StartJob = false
local moonshine1 = false
local moonshine2 = false
local moonshine3 = false
local moonshine4 = false
local moonshine5 = false
local moonshine6 = false
local moonshine7 = false

Citizen.CreateThread(function()
    local blip = N_0x554d9d53f696d002(1664425300, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z)
    SetBlipSprite(blip, 1961764827, 1)   
end)

RegisterNetEvent('scrp_moonshine:start')
AddEventHandler('scrp_moonshine:start', function(source)
    blip = N_0x554d9d53f696d002(203020899, Config.Zonas['moonshine1'].x, Config.Zonas['moonshine1'].y, Config.Zonas['moonshine1'].z)
    SetBlipSprite(blip, -570710357, 1)
    StartJob = true
    moonshine1 = true
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['init'].x, Config.Zonas['init'].y, Config.Zonas['init'].z) < 3.0) then
            if moonshine1 == false then
                DrawTxt(Language.translate[Config.lang]['press'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    TriggerServerEvent('scrp_moonshine:comjob')
                end
            end
        end
		-- start moonshine job / collect cracked corn / blip1
        if StartJob == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['moonshine1'].x, Config.Zonas['moonshine1'].y, Config.Zonas['moonshine1'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press1'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion()
                    TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['goto'], 5)
					RemoveBlip(blip)
					blip2 = N_0x554d9d53f696d002(203020899, Config.Zonas['moonshine2'].x, Config.Zonas['moonshine2'].y, Config.Zonas['moonshine2'].z)
                    SetBlipSprite(blip2, -570710357, 1)
					StartJob = false
					moonshine2 = true
					TriggerEvent('scrp_moonshine:corn_shipment')
                end
            end
		-- load cracked corn into wagon / blip2
		elseif moonshine2 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['moonshine2'].x, Config.Zonas['moonshine2'].y, Config.Zonas['moonshine2'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press2'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion2()
                    TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['carry'], 5)
                    RemoveBlip(blip2)
                    blip3 = N_0x554d9d53f696d002(203020899, Config.Zonas['moonshine3'].x, Config.Zonas['moonshine3'].y, Config.Zonas['moonshine3'].z)
                    SetBlipSprite(blip3, -570710357, 1)
                    moonshine2 = false
                    moonshine3 = true
                end
			end
		
		-- deliver cracked corn to the moonshine / blip3
		elseif moonshine3 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['moonshine3'].x, Config.Zonas['moonshine3'].y, Config.Zonas['moonshine3'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['pressc'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    if IsPedInAnyVehicle(PlayerPedId(), true) then
                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                        TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['corn_delivered'], 5)
						RemoveBlip(blip3)
						blip4 = N_0x554d9d53f696d002(203020899, Config.Zonas['moonshine4'].x, Config.Zonas['moonshine4'].y, Config.Zonas['moonshine4'].z)
						SetBlipSprite(blip4, -570710357, 1)
						moonshine3 = false
						moonshine4 = true
                    else
                        TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['noveh_corn'], 5)
                    end
                end
			end
		
		-- boil your cracked corn into mash / blip4
		elseif moonshine4 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['moonshine4'].x, Config.Zonas['moonshine4'].y, Config.Zonas['moonshine4'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press3'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
					DeleteVehicle(spawncar)
                    animacion1()
                    TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['goto'], 5)
                    RemoveBlip(blip4)
                    blip5 = N_0x554d9d53f696d002(203020899, Config.Zonas['moonshine5'].x, Config.Zonas['moonshine5'].y, Config.Zonas['moonshine5'].z)
                    SetBlipSprite(blip5, -570710357, 1)
                    moonshine4 = false
                    moonshine5 = true
                end
            end
		-- bottling your moonshine ready to ship / blip5
		elseif moonshine5 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['moonshine5'].x, Config.Zonas['moonshine5'].y, Config.Zonas['moonshine5'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press4'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
					DeleteVehicle(spawncar)
                    animacion3()
                    TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['goto'], 5)
                    RemoveBlip(blip5)
                    blip6 = N_0x554d9d53f696d002(203020899, Config.Zonas['moonshine6'].x, Config.Zonas['moonshine6'].y, Config.Zonas['moonshine6'].z)
                    SetBlipSprite(blip6, -570710357, 1)
                    moonshine5 = false
                    moonshine6 = true
					TriggerEvent('scrp_moonshine:moonshine_shipment')
                end
            end
		-- load moonshine into wagon / blip6
		elseif moonshine6 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['moonshine6'].x, Config.Zonas['moonshine6'].y, Config.Zonas['moonshine6'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['press5'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    animacion4()
                    TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['carry1'], 5)
                    RemoveBlip(blip6)
                    blip7 = N_0x554d9d53f696d002(203020899, Config.Zonas['moonshine7'].x, Config.Zonas['moonshine7'].y, Config.Zonas['moonshine7'].z)
                    SetBlipSprite(blip7, -570710357, 1)
                    moonshine6 = false
                    moonshine7 = true
                end
			end
		-- deliver the moonshine and get your reward money / xp / blip7
		elseif moonshine7 == true then
            if (Vdist(pos.x, pos.y, pos.z, Config.Zonas['moonshine7'].x, Config.Zonas['moonshine7'].y, Config.Zonas['moonshine7'].z) < 3.0) then
                DrawTxt(Language.translate[Config.lang]['pressf'], 0.3, 0.95, 0.4, 0.4, true, 255, 255, 255, 150, false)
                if IsControlJustPressed(0, 0xC7B5340A) then
                    if IsPedInAnyVehicle(PlayerPedId(), true) then
                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                        TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['completejob'] ..money.."$ | "..xp.."XP", 5)
						RemoveBlip(blip7)
						TriggerServerEvent('scrp_moonshine:reward', money, xp)
                        StartJob = false
                        moonshine1 = false
						moonshine7 = false
                    else
                        TriggerEvent("redemrp_notification:start", Language.translate[Config.lang]['noveh'], 5)
                    end
                end
			end
        end
    end
end)

RegisterNetEvent('scrp_moonshine:corn_shipment')
AddEventHandler('scrp_moonshine:corn_shipment', function()
	Citizen.Wait(0)

	local player = PlayerPedId()
	local vehicle = GetHashKey(Config.Vehicle1)
	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Citizen.Wait(0)
	end

	spawncar = CreateVehicle(vehicle, Config.Zonas['moonshine2'].x, Config.Zonas['moonshine2'].y, Config.Zonas['moonshine2'].z, Config.Zonas['moonshine2'].heading, true, false)
	SetVehicleOnGroundProperly(spawncar)
	SetModelAsNoLongerNeeded(vehicle)
end)

RegisterNetEvent('scrp_moonshine:moonshine_shipment')
AddEventHandler('scrp_moonshine:moonshine_shipment', function()
	Citizen.Wait(0)

	local player = PlayerPedId()
	local vehicle = GetHashKey(Config.Vehicle1)
	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Citizen.Wait(0)
	end

	spawncar = CreateVehicle(vehicle, Config.Zonas['moonshine6'].x, Config.Zonas['moonshine6'].y, Config.Zonas['moonshine6'].z, Config.Zonas['moonshine6'].heading, true, false)
	SetVehicleOnGroundProperly(spawncar)
	SetModelAsNoLongerNeeded(vehicle)
end)

-- collecting corn
function animacion()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_FARMER_RAKE'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, Language.translate[Config.lang]['collecting'])
    Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
end

-- mashing corn
function animacion1()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_SMOKE_CIGAR'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, Language.translate[Config.lang]['mashing'])
    Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
end

-- loading corn
function animacion2()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false)
    exports['progressBars']:startUI(7000, Language.translate[Config.lang]['load_corn'])
    Wait(7000)
    ClearPedTasksImmediately(PlayerPedId())
end

-- bottling moonshine
function animacion3()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_SMOKE_CIGAR'), 20000, true, false, false, false)
    exports['progressBars']:startUI(20000, Language.translate[Config.lang]['bottling'])
    Wait(20000)
    ClearPedTasksImmediately(PlayerPedId())
end

-- loading moonshine
function animacion4()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('PROP_HUMAN_SACK_STORAGE_IN'), 7000, true, false, false, false)
    exports['progressBars']:startUI(7000, Language.translate[Config.lang]['load_moonshine'])
    Wait(7000)
    ClearPedTasksImmediately(PlayerPedId())
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)

    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end