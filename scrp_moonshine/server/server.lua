RegisterServerEvent('scrp_moonshine:comjob')
AddEventHandler('scrp_moonshine:comjob', function()
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        if user.getJob() == Config.JobName then
            TriggerClientEvent('scrp_moonshine:start', source)
            TriggerClientEvent("redemrp_notification:start", source, Language.translate[Config.lang]['gopos'], 5)
        else
            TriggerClientEvent("redemrp_notification:start", source, Language.translate[Config.lang]['nojob'], 5)
        end
    end)
end)

RegisterServerEvent('scrp_moonshine:reward')
AddEventHandler('scrp_moonshine:reward', function(money, xp)
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        user.addMoney(money)
        user.addXP(xp)
	end)
end)