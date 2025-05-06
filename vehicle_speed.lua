local vehicleSpeeds = {
    [GetHashKey('t20')] = { baseSpeed = 200.0, turboSpeed = 260.0 }, 
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) 

        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, false)

        if vehicle and DoesEntityExist(vehicle) then 
            local modelHash = GetEntityModel(vehicle)

            local config = vehicleSpeeds[modelHash]

            if config then
                local turboInstalled = IsToggleModOn(vehicle, 18) 
                local speed = turboInstalled and config.turboSpeed or config.baseSpeed

                local speedInMetersPerSecond = speed / 3.6

                SetVehicleMaxSpeed(vehicle, speedInMetersPerSecond)  
            end
        end
    end
end)
