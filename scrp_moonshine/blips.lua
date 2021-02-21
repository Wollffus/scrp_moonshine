local blips = {
	--MOONSHINE JOB
	{ name = 'Moonshine Job', sprite = 1961764827, x=2731.55, y=-1402.37, z=46.18 }, -- moonshine job
}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, info.name)
    end  
end)