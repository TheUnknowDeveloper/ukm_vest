ESX = exports['es_extended']:getSharedObject()

for itemID, itemData in pairs(Config.Items) do
    ESX.RegisterUsableItem(itemID, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('ukm_warnweste:useItem', source, itemID)
    end)
end


