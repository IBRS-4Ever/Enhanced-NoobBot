
CreateConVar( "bot_enabled", 1 , FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Is the custom AI enabled?")
CreateConVar( "bot_weapon", "weapon_smg1", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What weapon bots use when they attack" )
CreateConVar( "bot_melee_weapon", "weapon_crowbar", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What weapon bots use when they meele attack")
CreateConVar( "bot_gundistance", 2500, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect enemies with bot_weapon?" )
CreateConVar( "bot_meddistance", 2500, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect med-kits?" )
CreateConVar( "bot_batdistance", 2500, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect battery?" )
CreateConVar( "bot_meleedistance", 250, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect enemies with a crowbar?[CURRENTLY DOESNT WORK]" )
CreateConVar( "bot_dodge_target", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make bots dodge target." )
CreateConVar( "bot_backdistance", 150, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set what distance bots should move back" )
CreateConVar( "bot_chase_target", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make bots chase target." )
CreateConVar( "bot_forwarddistance", 300, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set what distance bots should go towards the entity" )
CreateConVar( "bot_cussing", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Enable bots cussing in chat." )
CreateConVar( "bot_random_model", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Bots use random player models." )
CreateConVar( "bot_model", "models/player/kleiner.mdl", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set bots' player model." )
CreateConVar( "bot_allow_pickup_health", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Allow Bots to pickup Healthkits." )
CreateConVar( "bot_allow_pickup_battery", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Allow Bots to pickup batteries." )
CreateConVar( "bot_throw_back_grenades", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bots Throw back grenades.[CURRENTLY DOESNT WORK]" )
CreateConVar( "bot_random_bodygroup", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Random Bodygroup." )
CreateConVar( "bot_random_skin", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Random Skin." )
CreateConVar( "bot_attack_friendly_npcs", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot attack friendly NPCs." )
CreateConVar( "bot_ignore_unseen", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot ignore unseen targets." )
CreateConVar( "bot_talk", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot talk." )
CreateConVar( "bot_random_color", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot use random colors." )
CreateConVar( "bot_nb_debug", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Debug Mode." )
CreateConVar( "bot_target_player", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot target Players." )
CreateConVar( "bot_target_npc", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot target NPCs." )
CreateConVar( "bot_target_bot", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot target BOTs." )
CreateConVar( "bot_target_prop", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot target props." )
CreateConVar( "bot_firemode", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot use Alt-Fire." )
CreateConVar( "bot_aim_head", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot shoot Head." )
CreateConVar( "bot_no_recoil", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot better aim." )
CreateConVar( "bot_fov", 90, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Bot's FOV", 0, 180 )
CreateConVar( "bot_chat_language", "English", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Bot chat language." )

concommand.Add( "bot_get_model", function( ply )
	local model = ply:GetModel()
    RunConsoleCommand( "bot_model", model )
    NBDebug( "[NOOB BOTS] Get Model: "..model )
end)

concommand.Add( "bot_get_weapon", function( ply )
	if ply:Alive() then
		local weapon = ply:GetActiveWeapon():GetClass()
		RunConsoleCommand( "bot_weapon", weapon )
		NBDebug( "[NOOB BOTS] Get Weapon: "..weapon )
	end
end)

concommand.Add( "bot_resetconvar", function( ply )
	RunConsoleCommand( "bot_gundistance", 2500 )
	RunConsoleCommand( "bot_meddistance", 2500 )
	RunConsoleCommand( "bot_batdistance", 2500 )
	RunConsoleCommand( "bot_meleedistance", 250 )
	RunConsoleCommand( "bot_weapon", "weapon_smg1" )
	RunConsoleCommand( "bot_target_player", 0 )
	RunConsoleCommand( "bot_target_npc", 0 )
	RunConsoleCommand( "bot_target_bot", 0 )
	RunConsoleCommand( "bot_target_prop", 0 )
	RunConsoleCommand( "bot_ignore_unseen", 1 )
	RunConsoleCommand( "bot_attack_friendly_npcs", 0 )
	RunConsoleCommand( "bot_aim_head", 0 )
	RunConsoleCommand( "bot_no_recoil", 1 )
	RunConsoleCommand( "bot_firemode", 0 )
	RunConsoleCommand( "bot_backdistance", 150)
	RunConsoleCommand( "bot_forwarddistance", 300)
	RunConsoleCommand( "bot_random_model", 0)
	RunConsoleCommand( "bot_model", "models/player/kleiner.mdl")
	RunConsoleCommand( "bot_allow_pickup_health", 0)
	RunConsoleCommand( "bot_allow_pickup_battery", 0)
	RunConsoleCommand( "bot_talk", 0)
	RunConsoleCommand( "bot_fov", 90)
	RunConsoleCommand( "bot_random_color", 1)
	RunConsoleCommand( "bot_random_bodygroup", 1)
	RunConsoleCommand( "bot_random_skin", 1)
	RunConsoleCommand( "bot_cussing", 1)
    NBDebug("[NOOB BOTS] All Command Reset.")
end )

local BlackList = {
	"npc_grenade_frag",
	"monster_barney_dead",
	"monster_gman",
	"monster_hevsuit_dead",
	"monster_hgrunt_dead",
	"monster_scientist_dead",
	"npc_template_maker",
	"info_npc_spawn_destination",
	"npc_enemyfinder",
	"npc_combinedropship",
	"npc_apcdriver",
	"npc_bullseye",
	"prop_ragdoll",
	"obj_vj_gib",
	"bullseye_strider_focus"
}

local FriendlyNPC = {
	"npc_alyx",
	"npc_barney",
	"npc_citizen",
	"npc_dog",
	"npc_eli",
	"npc_fisherman",
	"npc_kleiner",
	"npc_magnusson",
	"npc_monk",
	"npc_mossman",
	"npc_vortigaunt",
	"monster_barney",
	"monster_scientist",
	"monster_sitting_scientist"
}

local HealthEnts = {
	"item_healthkit",
	"item_healthvial",
	"item_grubnugget"
}

local BatteryEnts = {
	"item_battery"
}

local last_dmgpos = {}
local last_dmggiver = {}

hook.Add("EntityTakeDamage", "bot_damage_react", function(ply, dmginfo)
	if ply:IsPlayer() and ply:IsBot() then

		last_dmgpos[ply] = dmginfo:GetDamagePosition()
		last_dmggiver[ply] = dmginfo:GetAttacker()
		NBDebug("Get damage from "..tostring(last_dmgpos[ply]).." Attacker: "..tostring(last_dmggiver[ply]))
	end
end)

function NBDebug(msg)
	if GetConVar( "bot_nb_debug" ):GetInt() > 0 then
		print(msg)
	end
end

function CheckTarget(ent)
	if GetConVar( "bot_target_player" ):GetInt() == 1 then
		if ent:IsPlayer() and !ent:IsBot() then return true end
	end
	
	if GetConVar( "bot_target_npc" ):GetInt() == 1 then
		if ent:IsNPC() and !table.HasValue(BlackList,ent:GetClass()) then
			if table.HasValue( FriendlyNPC, ent:GetClass() ) and GetConVar( "bot_attack_friendly_npcs" ):GetInt() == 0 then return false
			else return true end
		end
	end
	
	if GetConVar( "bot_target_bot" ):GetInt() == 1 then
		if ent:IsPlayer() and ent:IsBot() then return true end
	end
	
	if GetConVar( "bot_target_prop" ):GetInt() == 1 then
		if ent:GetClass() == "prop_physics" then return true end
		-- if ent:GetClass() == "prop_ragdoll" then return true end
	end
end

function mystart(ply,cmd)
	if !ply:IsBot() or !ply:Alive() then return end
	
		if GetConVar( "bot_enabled" ):GetInt() >= 1 then
		local NearestTarget = NULL
		local NearestBat = NULL
		local NearestMed = NULL
		local NearestTargetDist = 9999999 -- 初始化一个非常大的值，表示最大距离
		local NearestMedDist = 9999999
		local NearestBatDist = 9999999

		cmd:ClearButtons()
		cmd:ClearMovement()
		distance = GetConVar( "bot_gundistance" ):GetInt()
		medpackdistance = GetConVar( "bot_meddistance" ):GetInt()
		batterydistance = GetConVar( "bot_batdistance" ):GetInt()
		meleeweapon = GetConVar( "bot_melee_weapon" ):GetString()
		meleedistance = GetConVar( "bot_meddistance" ):GetInt()
		weapon = GetConVar( "bot_weapon" ):GetString()
			
		if GetConVar( "bot_allow_pickup_health" ):GetInt() > 0 then
			for a,b in pairs(ents.FindInCone(ply:GetPos(),ply:GetAimVector(),distance,math.cos( math.rad( GetConVar("bot_fov"):GetInt() ) ))) do
				if table.HasValue(HealthEnts,b:GetClass()) then
					if ply:IsLineOfSightClear(b) then
						if ply:GetPos():Distance( b:GetPos() ) < medpackdistance then
							local dist = b:GetPos():Distance(ply:GetPos())
							if dist < NearestMedDist then
								NearestMed = b
								NearestMedDist = dist
							end
							if ply:Health() < ply:GetMaxHealth() then
								vmed1 = NearestMed:GetPos() + NearestMed:OBBCenter()
								vmed2 = ply:GetShootPos()
								cmd:SetForwardMove(1000)
								cmd:SetButtons( IN_SPEED )
								ply:SetWalkSpeed(200)
								ply:SetEyeAngles( ( vmed1 - vmed2 ):Angle() )
							end
						end
					end
				end
			end	
		end
		
		if GetConVar( "bot_allow_pickup_battery" ):GetInt() > 0 then
			for a,b in pairs(ents.FindInCone(ply:GetPos(),ply:GetAimVector(),distance,math.cos( math.rad( GetConVar("bot_fov"):GetInt() ) ))) do
				if table.HasValue(BatteryEnts,b:GetClass()) then
					if ply:IsLineOfSightClear(b) then
						if ply:GetPos():Distance( b:GetPos() ) < batterydistance then
							local dist = b:GetPos():Distance(ply:GetPos())
							if dist < NearestBatDist then
								NearestBat = b
								NearestBatDist = dist
							end
							if ply:Armor() < ply:GetSuitPower() then
								vbat1 = NearestBat:GetPos() + NearestBat:OBBCenter()
								vbat2 = ply:GetShootPos()
								cmd:SetForwardMove(1000)
								cmd:SetButtons( IN_SPEED )
								ply:SetWalkSpeed(200)
								ply:SetEyeAngles( ( vbat1 - vbat2 ):Angle() )
							end
						end
					end
				end
			end	
		end
		
		for a,b in pairs(ents.FindInCone(ply:GetPos(),ply:GetAimVector(),distance,math.cos( math.rad( GetConVar("bot_fov"):GetInt() ) ))) do
			if CheckTarget(b) then
				if b:Health() > 0 and b ~= ply then
					if ply:IsLineOfSightClear(b) or GetConVar("bot_ignore_unseen"):GetInt() == 0 then
						local dist = b:GetPos():Distance(ply:GetPos())
						if dist < NearestTargetDist then
							NearestTarget = b
							NearestTargetDist = dist
						end
						ply:Give( weapon )
						ply:SelectWeapon( weapon )
						if timer.TimeLeft( "refil"..ply:EntIndex() ) == nil then
							ply:GiveAmmo(9999,ply:GetActiveWeapon():GetPrimaryAmmoType())
							ply:GiveAmmo(9999,ply:GetActiveWeapon():GetSecondaryAmmoType())
							timer.Create( "refil"..ply:EntIndex(), 5, 1, function() end )
						end
						
						if GetConVar( "bot_firemode" ):GetInt() == 0 then
							cmd:SetButtons( IN_ATTACK )
						elseif GetConVar( "bot_firemode" ):GetInt() == 1 then
							cmd:SetButtons( IN_ATTACK2 )
						elseif GetConVar( "bot_firemode" ):GetInt() == 2 then
							local FireCase = { IN_ATTACK, IN_ATTACK2 }
							cmd:SetButtons( FireCase[math.random(1, #FireCase)] )
						elseif GetConVar( "bot_firemode" ):GetInt() == 3 then
							cmd:SetButtons( bit.bor(IN_ATTACK,IN_ATTACK2) )
						end
						
						NBDebug( "[NOOB BOTS] Target: "..NearestTarget:GetClass() )
						
						if GetConVar( "bot_aim_head" ):GetInt() > 0 and NearestTarget:GetAttachment(NearestTarget:LookupAttachment("eyes")) ~= nil then
							vec1 = NearestTarget:GetAttachment(NearestTarget:LookupAttachment("eyes")).Pos
						else
							vec1 = NearestTarget:LocalToWorld(NearestTarget:OBBCenter())
						end
						
						if ply:GetPos():Distance( NearestTarget:GetPos() ) >  GetConVar( "bot_forwarddistance" ):GetInt() and GetConVar("bot_chase_target"):GetInt() > 0 then
							cmd:SetForwardMove(1000)
							ply:SetWalkSpeed(200)
						elseif ply:GetPos():Distance(NearestTarget:GetPos()) < GetConVar( "bot_backdistance" ):GetInt() and GetConVar("bot_dodge_target"):GetInt() > 0 then
							cmd:SetForwardMove(-1000)
							ply:SetWalkSpeed(200)
							if GetConVar( "bot_firemode" ):GetInt() == 0 then
								cmd:SetButtons( bit.bor(IN_SPEED, IN_ATTACK) )
							elseif GetConVar( "bot_firemode" ):GetInt() == 1 then
								cmd:SetButtons( bit.bor(IN_SPEED, IN_ATTACK2) )
							elseif GetConVar( "bot_firemode" ):GetInt() == 2 then
								local FireCase = { IN_ATTACK, IN_ATTACK2 }
								cmd:SetButtons( bit.bor(IN_SPEED, FireCase[math.random(1, #FireCase)]) )
							end
						else
							cmd:SetForwardMove(0)
							ply:SetWalkSpeed(1)
						end
						
						local vec2 = ply:GetShootPos()
						if GetConVar( "bot_no_recoil" ):GetInt() > 0 then
							ply:SetEyeAngles( ( vec1 - vec2 ):Angle() - ply:GetViewPunchAngles() ) 
						else
							ply:SetEyeAngles( ( vec1 - vec2 ):Angle() )
						end
						ply:SetWalkSpeed(200)
					end
				end
			end
		end
		
		if ply:WaterLevel() >= 2 then
			cmd:SetUpMove(200)
		end
	end
end
hook.Add("StartCommand","mystart",mystart)

--Unused Code
function botLevelUp( ply,cmd )
	if ply:IsBot() and ply:Alive() then
		plyLevel = ply:GetNetworkedInt( "PlyLevel", 1 )
		ply:SetNetworkedInt( "PlyLevel", plyLevel + 1 )
	end
end
hook.Add("StartCommand","botLevelUp",botLevelUp)

function botDeath( victim, attacker, weapon )
	if victim:IsBot() then
		ply = victim
		botSaySomething(ply,"death",50)
		print(attacker)
		if attacker:IsPlayer() and attacker:IsBot() then
			botSaySomething(attacker,"attack",50)
		end
	end
end
hook.Add("PlayerDeath","botDeath",botDeath)

function spawnRun(ply)
	if ply:IsBot() then
		model = GetConVar( "bot_model" ):GetString()
		weapon = GetConVar( "bot_weapon" ):GetString()
		
		ply:Give( weapon )
		ply:SelectWeapon( weapon )
		
		NBDebug( "[NOOB BOTS] Bot Spawned!" )
		local RandomModel = table.Random( player_manager.AllValidModels())
		timer.Simple(0.01,function()
			if GetConVar( "bot_random_model" ):GetInt() > 0 then
				ply:SetModel( RandomModel )
				NBDebug( "[NOOB BOTS] Model: "..RandomModel)
			else
				ply:SetModel( model )
				NBDebug( "[NOOB BOTS] Set Model To: "..model )
			end
		end)
			
		if GetConVar( "bot_random_color" ):GetInt() > 0 then
			local colors = Vector(math.random(0,255) / 255,math.random(0,255) / 255,math.random(0,255) / 255)
			timer.Simple(0.01,function() ply:SetPlayerColor(colors) end)
			NBDebug( "[NOOB BOTS] Colors: "..tostring(colors))
		end
			
		if GetConVar( "bot_random_bodygroup" ):GetInt() > 0 then
			local num_bodygroups = ply:GetNumBodyGroups() -- 获取模型的bodygroup数量
			for i = 0, num_bodygroups - 1 do					
				local num_choices = ply:GetBodygroupCount(i) -- 获取当前bodygroup下的可以选择的模型数量
				if num_choices > 1 then
					local choice = math.random(0, num_choices - 1) -- 随机选择一种模型
					ply:SetBodygroup(i, choice) -- 设置新的bodygroup值
				end
			end
		end
			
		if GetConVar( "bot_random_skin" ):GetInt() > 0 then
			local num_skins = ply:SkinCount()
			local choice = math.random(0, num_skins - 1)
			ply:SetSkin(choice)
		end
			
		botSaySomething(ply,"spawn",30)
	end
end
hook.Add("PlayerSpawn","spawnRun",spawnRun)

util.AddNetworkString( "sendToChat" )
function botSaySomething(ply,saytype,chance)
	if GetConVar( "bot_talk" ):GetInt() > 0 then
		local ran = math.random(1,100)
		if chance ~= nil then
			if ran < chance then
				local cancuss = GetConVar( "bot_cussing" ):GetInt()
				if saytype == "spawn" then
					local msgs = {"I am coming 4 u! Again!","I am coming for you! Again!","You think you could beat me?","(▀̿Ĺ̯▀̿ ̿)","Back from the dead.","Respawned.","Take 2"}
					net.Start("sendToChat")
					local msg = msgs[math.random(1,#msgs)]
					net.WriteString(msg)
					net.WriteEntity(ply)
					net.Broadcast()
				end
				if saytype == "death" then
					local msgs = { "Really?" , "Ugh.", ":("}
					if cancuss > 0 then
						msgs = {"Fucking god damnit! Really?","OH FUCK!NO DOOD!","Damnit.","CYKA BLYAD","Yikes","IDI NAHUI","F*CK","(ง ͠° ͟ل͜ ͡°)ง","well shet.","FFS","Ey","That was uncalled for man"}
					end
					net.Start("sendToChat")
					local msg = msgs[math.random(1,#msgs)]
					net.WriteString(msg)
					net.WriteEntity(ply)
					net.Broadcast()
				end

				if saytype == "attack" then
					local msgs = {"Goodbye.","You just died.","gg"}
					if cancuss > 0 then
						msgs = {"Get rekt scrub","You just got pwned!","gg","OOF","Rest in Piss","Yikes","﴾͡๏̯͡๏﴿ O'RLY?","lol","Deserved","Karma"}
					end
					net.Start("sendToChat")
					local msg = msgs[math.random(1,#msgs)]
					net.WriteString(msg)
					net.WriteEntity(ply)
					net.Broadcast()
				end
			end
		end
	end
end

function addonInit()
	NBDebug("[NOOB BOT] Bot Loaded.")
	timer.Simple(3,function()
		RunConsoleCommand( "bot_resetconvar" )
	end)
end
hook.Add("Initialize","addonInit",addonInit)




