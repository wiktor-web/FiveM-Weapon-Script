local weapons = {
    {name = "WEAPON_PISTOL", ammo = 100},
    {name = "WEAPON_COMBATPISTOL", ammo = 100},
    -- Add more weapons here
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if IsControlJustReleased(0, 246) then -- Y button
            local playerPed = PlayerPedId()
            
            -- Add weapons
            for _, weapon in ipairs(weapons) do
                GiveWeaponToPed(playerPed, GetHashKey(weapon.name), weapon.ammo, false, true)
            end
            
            -- Send notification
            TriggerEvent('notification', '~r~Added weapons', 'YOUR SERVER', 'CHAR_LJT', 5000) 
        end
    end
end)

RegisterNetEvent('notification')
AddEventHandler('notification', function(message, title, sender, duration)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    SetNotificationMessage(sender, sender, true, 4, title, false, 'CHAR_DEFAULT', 'hud_colours_purple', 1)
    local notification = DrawNotification(false, true)
    Citizen.Wait(duration)
    RemoveNotification(notification)
end)
