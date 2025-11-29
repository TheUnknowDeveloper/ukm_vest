ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('ukm_warnweste:useItem')
AddEventHandler('ukm_warnweste:useItem', function(itemID)
    local playerPed = PlayerPedId()

    if Config.Items[itemID] then
        local itemConfig = Config.Items[itemID]
        local currentDrawable = GetPedDrawableVariation(playerPed, itemConfig.clothingComponent)
        local currentTexture = GetPedTextureVariation(playerPed, itemConfig.clothingComponent)

        if currentDrawable == itemConfig.clothingDrawable and currentTexture == itemConfig.clothingTexture then
            -- Auszieh-Animation starten
            RequestAnimDict("clothingshirt")
            while not HasAnimDictLoaded("clothingshirt") do
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, "clothingshirt", "try_shirt_negative_d", 8.0, -8.0, -1, 51, 0, false, false, false)

            -- Warte auf das Ende der Animation
            Citizen.Wait(1500)
            ClearPedTasks(playerPed)

            -- Kleidung ausziehen
            SetPedComponentVariation(playerPed, itemConfig.clothingComponent, 0, 0, 2)
            ESX.ShowNotification("Du hast " .. itemConfig.name .. " ausgezogen.")
        else
            -- Anzieh-Animation starten
            RequestAnimDict("clothingshirt")
            while not HasAnimDictLoaded("clothingshirt") do
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, "clothingshirt", "try_shirt_positive_d", 8.0, -8.0, -1, 51, 0, false, false, false)

            -- Warte auf das Ende der Animation
            Citizen.Wait(1500)
            ClearPedTasks(playerPed)

            -- Kleidung anziehen
            SetPedComponentVariation(playerPed, itemConfig.clothingComponent, itemConfig.clothingDrawable, itemConfig.clothingTexture, 2)
            ESX.ShowNotification("Du hast " .. itemConfig.name .. " angezogen.")
        end
    else
        print("Das Item " .. itemID .. " existiert nicht in der Konfiguration.")
    end
end)

