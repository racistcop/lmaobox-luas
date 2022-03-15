local function damageLogger(event)

    if (event:GetName() == 'player_hurt' ) then -- https://wiki.alliedmods.net/Team_Fortress_2_Events#player_hurt
        
        local victim = entities.GetByUserID(event:GetInt("userid"))
        local health = event:GetInt("health")
        local attacker = entities.GetByUserID(event:GetInt("attacker"))
        local damage = event:GetInt("damageamount")
        
        if (attacker == nil or entities.GetLocalPlayer():GetIndex() ~= attacker:GetIndex()) then -- prevents printing damage taken
            return
        end

        print("You hit " ..  victim:GetName() .. " or ID " .. victim:GetIndex() .. " for " .. damage .. "HP they now have " .. health .. "HP left")

    end

end

callbacks.Register("FireGameEvent", "exampledamageLogger", damageLogger)
