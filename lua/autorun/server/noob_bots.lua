
CreateConVar( "bot_enabled", 1 , FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Is the custom AI enabled?")
CreateConVar( "bot_weapon", "weapon_smg1", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What weapon bots use when they attack" )
CreateConVar( "bot_melee_weapon", "weapon_crowbar", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What weapon bots use when they meele attack")
CreateConVar( "bot_gundistance", 2500, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect enemies with bot_weapon?" )
CreateConVar( "bot_meddistance", 2500, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect med-kits?" )
CreateConVar( "bot_batdistance", 2500, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect battery?" )
CreateConVar( "bot_meleedistance", 250, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] What distance can bots detect enemies with a crowbar?[CURRENTLY DOESNT WORK]" )
CreateConVar( "bot_target", "", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set what entity bots like to attack" )
CreateConVar( "bot_medtarget", "item_health*", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set what entity bots will pickup when low health." )
CreateConVar( "bot_battarget", "item_battery", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set what entity bots will pickup to charge armor." )
CreateConVar( "bot_backdistance", 150, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set what distance bots should move back" )
CreateConVar( "bot_forwarddistance", 300, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set what distance bots should go towards the entity" )
CreateConVar( "bot_cussing", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Enable bots cussing in chat." )
CreateConVar( "bot_random_model", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Bots use random player models." )
CreateConVar( "bot_model", "models/player/kleiner.mdl", FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Set bots' player model." )
CreateConVar( "bot_allow_pickup_health", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Allow Bots to pickup Healthkits." )
CreateConVar( "bot_allow_pickup_battery", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Allow Bots to pickup batteries." )
CreateConVar( "bot_throw_back_grenades", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bots Throw back grenades.[CURRENTLY DOESNT WORK]" )
CreateConVar( "bot_model_bodygroup", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Bodygroup to change, 0 is the first." )
CreateConVar( "bot_model_bodygroup_value", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Sets the bodygroup value." )
CreateConVar( "bot_attack_friendly_npcs", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot attack friendly NPCs." )
CreateConVar( "bot_talk", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot talk." )
CreateConVar( "bot_random_color", 1, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot use random colors." )
CreateConVar( "bot_nb_debug", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Debug Mode." )
CreateConVar( "bot_alt_firemode", 0, FCVAR_SERVER_CAN_EXECUTE, "[NOOB BOTS] Make Bot use Alt-Fire." )

concommand.Add( "bot_get_model", function( ply )
	local model = ply:GetModel()
    RunConsoleCommand( "bot_model", model )
    NBDebug( "[NOOB BOTS] Get Model: ",model )
end )

concommand.Add( "bot_get_weapon", function( ply )
	if ply:Alive() then
		local weapon = ply:GetActiveWeapon():GetClass()
		RunConsoleCommand( "bot_weapon", weapon )
		NBDebug( "[NOOB BOTS] Get Weapon: ", weapon )
	end
end )

concommand.Add( "bot_resetconvar", function( ply )
	RunConsoleCommand( "bot_gundistance", 2500 )
	RunConsoleCommand( "bot_meddistance", 2500 )
	RunConsoleCommand( "bot_batdistance", 2500 )
	RunConsoleCommand( "bot_meleedistance", 250 )
	RunConsoleCommand( "bot_weapon", "weapon_smg1" )
	RunConsoleCommand( "bot_target", "" )
	RunConsoleCommand( "bot_medtarget", "item_health*" )
	RunConsoleCommand( "bot_battarget", "item_battery" )
	RunConsoleCommand( "bot_backdistance", 150)
	RunConsoleCommand( "bot_forwarddistance", 300)
	RunConsoleCommand( "bot_random_model", 0)
	RunConsoleCommand( "bot_model", "models/player/kleiner.mdl")
	RunConsoleCommand( "bot_allow_pickup_health", 0)
	RunConsoleCommand( "bot_allow_pickup_battery", 0)
	RunConsoleCommand( "bot_talk", 0)
	RunConsoleCommand( "bot_random_color", 1)
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
 "monster_sitting_scientist",
}

local HealthEnts = {
 "item_healthkit",
 "item_healthvial",
 "item_grubnugget",
}

local BatteryEnts = {
 "item_battery",
}

local MSG = {
 "#nb.chat.really",
 "#nb.chat.test",
}

function NBDebug(msg,var)
	if GetConVar( "bot_nb_debug" ):GetInt() > 0 then
		if var == nil then
			print(msg)
		else
			print(msg,var)
		end
	end
end

-- function NBBotThinking()

	-- local index		=	ply:EntIndex()
	
	-- -- I used math.Rand as a personal preference, It just prevents all the timers being ran at the same time
	-- -- as other bots timers.
	-- timer.Create( "tutorial_bot_think" .. index , math.Rand( 0.08 , 0.15 ) , 0 , function()
		
		-- if IsValid( ply ) and ply:Alive() then
			
			-- -- A quick condition statement to check if our enemy is no longer a threat.
			-- -- Most likely done best in its own function. But for this tutorial we will make it simple.
			-- if !IsValid( ply.Enemy ) or !ply.Enemy:IsPlayer() or !ply.Enemy:Alive() then
				
				-- ply.Enemy		=	nil
				
			-- end
			
			 -- ply:TBotFindRandomEnemy()
			
		-- else
			
			-- timer.Remove( "tutorial_bot_think" .. index ) -- We don't need to think while dead.
			
		-- end
		
	-- end)
	
-- end

-- function NBBotFindRandomEnemy()
	-- if IsValid( ply.Enemy ) then return end
	
	-- local VisibleEnemies = {} -- So we can select a random enemy.
	
	-- for k, v in ipairs( player.GetAll() ) do
		
		-- if v:Alive() and v != ply then -- Make sure they are alive and we don't want to target ourself.
			
			-- if v:Visible( ply ) then 
                        -- -- Using Visible() as an example of why we should delay the thinking.
				
				-- VisibleEnemies = v
				
			-- end
			
		-- end
		
	-- end
	
	-- ply.Enemy = VisibleEnemies
	
-- end

function NBBotThinking()

	
	local index		=	ply:EntIndex()
	
    -- I used math.Rand as a personal preference,
    -- It just prevents all the timers being ran at the same time as other bots timers
	timer.Create( "nb_bot_think" .. index , math.Rand( 0.08 , 0.15 ) , 0 , function()
		
		if IsValid( ply ) and ply:Alive() then
			
			-- A quick condition statement to check if our enemy is no longer a threat.
			-- Most likely done best in its own function. But for this tutorial we will make it simple.
		else
			
			timer.Remove( "nb_bot_think" .. index ) -- We don't need to think while dead.
			
		end
		
	end)
end

function mystart(ply,cmd)
	if !ply:IsBot() or !ply:Alive() then return end
		if GetConVar( "bot_enabled" ):GetInt() >= 1 then
			cmd:ClearButtons()
			cmd:ClearMovement()
			med = GetConVar( "bot_medtarget" ):GetString()
			bat = GetConVar( "bot_battarget" ):GetString()
			distance = GetConVar( "bot_gundistance" ):GetInt()
			medpackdistance = GetConVar( "bot_meddistance" ):GetInt()
			batterydistance = GetConVar( "bot_batdistance" ):GetInt()
			meleeweapon = GetConVar( "bot_melee_weapon" ):GetString()
			meleedistance = GetConVar( "bot_meddistance" ):GetInt()
			target = GetConVar("bot_target"):GetString()
			weapon = GetConVar( "bot_weapon" ):GetString()
			
		if GetConVar( "bot_allow_pickup_health" ):GetInt() > 0 then
		-- print( string.Explode( " ", table.ToString( HealthEnts,"" , true )) )
			-- for k,v in pairs( ents.FindByClass( table.ToString( HealthEnts,"" , true ) )) do
			 for k,v in pairs( ents.FindByClass( med )) do
				for a,b in pairs(ents.FindInSphere(v:GetPos(),0.3)) do
					if ply:GetPos():Distance( b:GetPos() ) < medpackdistance then
						if ply:Health() < ply:GetMaxHealth() then
							vmed1 = b:GetPos() + b:OBBCenter()
							vmed2 = ply:GetShootPos()
							cmd:SetForwardMove(1000)
							cmd:SetButtons( bit.bor(IN_SPEED,IN_USE) )
							ply:SetWalkSpeed(200)
							ply:SetEyeAngles( ( vmed1 - vmed2 ):Angle() )

							if ply:GetPos():Distance( b:GetPos() ) <= 64 then
								vmed1 = b:GetPos() + b:OBBCenter()
								vmed2 = ply:GetShootPos()
								cmd:SetForwardMove(1000)
								cmd:SetButtons( IN_USE )
								ply:SetWalkSpeed(200)
								ply:SetEyeAngles( ( vmed1 - vmed2 ):Angle() )
							end
						end
					end
				end
			end	
		end
		
		if GetConVar( "bot_allow_pickup_battery" ):GetInt() > 0 then
			for k,v in pairs( ents.FindByClass(bat) ) do
				for a,b in pairs(ents.FindInSphere(v:GetPos(),0.3)) do
					if ply:GetPos():Distance( b:GetPos() ) < batterydistance then
						if ply:Armor() < ply:GetSuitPower() then
							vmed1 = b:GetPos() + b:OBBCenter()
							vmed2 = ply:GetShootPos()
							cmd:SetForwardMove(1000)
							cmd:SetButtons( bit.bor(IN_SPEED,IN_USE) )
							ply:SetWalkSpeed(200)
							ply:SetEyeAngles( ( vmed1 - vmed2 ):Angle() )
					
							if ply:GetPos():Distance( b:GetPos() ) <= 64 then
								vmed1 = b:GetPos() + b:OBBCenter()
								vmed2 = ply:GetShootPos()
								cmd:SetForwardMove(1000)
								cmd:SetButtons( IN_USE )
								ply:SetWalkSpeed(200)
								ply:SetEyeAngles( ( vmed1 - vmed2 ):Angle() )
							end
						end
					end
				end
			end	
		end
		
		for k, v in pairs( ents.FindByClass( target ) ) do
			for a,b in pairs(ents.FindInSphere(v:GetPos(),0.01)) do
				if ply:GetPos():Distance( b:GetPos() ) < distance and b:Health() > 0 and b ~= ply and !table.HasValue(BlackList,v:GetClass()) then -- and ply:Visible(b)
					if ply:IsLineOfSightClear(b) then
						ply:Give( weapon )
						ply:SelectWeapon( weapon )
						ply:GiveAmmo(9999,ply:GetActiveWeapon():GetPrimaryAmmoType())
						if GetConVar( "bot_alt_firemode" ):GetInt() == 0 then
							cmd:SetButtons( IN_ATTACK )
						else
							cmd:SetButtons( IN_ATTACK2 )
						end
						NBDebug( "[NOOB BOTS] Target: ", b)
						local vec1 = b:GetPos() + b:OBBCenter()
							if ply:GetPos():Distance( b:GetPos() ) >  GetConVar( "bot_forwarddistance" ):GetInt() then
								cmd:SetForwardMove(1000)
								ply:SetWalkSpeed(200)
							elseif ply:GetPos():Distance(b:GetPos()) < GetConVar( "bot_backdistance" ):GetInt() then
								cmd:SetForwardMove(-1000)
								ply:SetWalkSpeed(200)
								cmd:SetButtons( bit.bor(IN_SPEED,IN_ATTACK) )
							else
								cmd:SetForwardMove(0)
								ply:SetWalkSpeed(1)
							end
						local vec2 = ply:GetShootPos() 
							ply:SetEyeAngles( ( vec1 - vec2 ):Angle() )
						local target = 0
							ply:SetWalkSpeed(200)
					end
				end
			end
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
		bodygroup = GetConVar( "bot_model_bodygroup" ):GetInt()
		bgnum = GetConVar( "bot_model_bodygroup_value" ):GetInt()
		model = GetConVar( "bot_model" ):GetString()
		ply:Give(GetConVar( "bot_weapon" ):GetString())
		ply:SelectWeapon(GetConVar( "bot_weapon" ):GetString())
		NBDebug( "[NOOB BOTS] Bot Spawned!" )
		local RandomModel = table.Random( player_manager.AllValidModels())
			timer.Simple(0.01,function()
				if GetConVar( "bot_random_model" ):GetInt() > 0 then
					ply:SetModel( RandomModel )
					NBDebug( "[NOOB BOTS] Model: ", RandomModel)
				else
					ply:SetModel( model )
					ply:SetBodygroup( bodygroup, bgnum )
					NBDebug( "[NOOB BOTS] Set Model To: ", model )
				end
			end)
			if GetConVar( "bot_random_color" ):GetInt() > 0 then
				local colors = Vector(math.random(0,255) / 255,math.random(0,255) / 255,math.random(0,255) / 255)
				timer.Simple(0.01,function() ply:SetPlayerColor(colors) end)
				NBDebug( "[NOOB BOTS] Colors: " ,colors)
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
						local msgs = {"I am coming 4 u! Again!","I am coming for you! Again!","You think you could beat me?","(?????????????? ??)","Back from the dead.","Respawned.","Take 2"}
							net.Start("sendToChat")
						local msg = msgs[math.random(1,#msgs)]
							net.WriteString(msg)
							net.WriteEntity(ply)
							net.Broadcast()
					end

				if saytype == "death" then
					local msgs = { "Really?" , "Ugh.", ":("}
						if cancuss > 0 then
							msgs = {"Fucking god damnit! Really?","OH FUCK!NO DOOD!","Damnit.","CYKA BLYAD","Yikes","IDI NAHUI","F*CK","(??? ???? ?????? ????)???","well shet.","FFS","Ey","That was uncalled for man"}
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
							msgs = {"Get rekt scrub","You just got pwned!","gg","OOF","Rest in Piss","Yikes","?????????????????? O'RLY?","lol","Deserved","Karma"}
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

function botInit( ply )
	if ply:IsBot() then
		names = {"Cave Johnson","Chell and PotatOS","GlaDOS","I'm a aim-bot","Poopy Joe","noob_bots.lua","what do I put here?","Pewdiepie","Not Pewdiepie","hl2.exe","Pootis","Toattly not a 5-year-old","I got this game for my birthday","xX360NoscopeBlazeItAlpha420FazeClanXx","YOU SUX","-_-","Gman","gmod.exe","hax.exe loaded","hax.exe","KA-BOOM","Muselk","ster","Star","Jerma985","Idk what to type anymore","lol","Half Life 2.9","SYNTAX:ERROR","Bill Cosby","bot.exe has stopped working","hl2.exe has stopped working","PS4 is better then PC","PC is better then PS4","Xbone is better then PC","PC is better then Xbone","PS4 is better then Xbone","Xbone is better then PS4","PS4 SUX","XBONE SUX","PC SUX","WII U SUX",""}
		
		Timestamp = os.time()
		TimeStr = os.date( "%m %d" , Timestamp )
		print( TimeStr )
		
		if TimeStr == "04 06" then
			ply:SetNWString("Name", "Testing123" )
		else
			ply:SetNWString("Name", names[math.random(1,#names)] )
		end
		--ply:SetNWString("Name", names[math.random(1,#names)] )
		
		
	    usermessage.Hook( "Send_Print", function( data )

			chat.PlaySound()
			   -- Prints in white
			chat.AddText( team.GetColor( ply:Team() ), ply:GetName() )
		end )
		PrintMessage(HUD_PRINTTALK,"BOT "..ply:GetName().." has joined the game")
	end
end
hook.Add("PlayerInitialSpawn","botInit",botInit)

function botKick( ply )
	if ply:IsBot() then
		PrintMessage( HUD_PRINTTALK, "BOT " ..ply:GetName().. " has been kicked from the server." )
	end
end
hook.Add( "PlayerDisconnected","botKick",botKick)

function addonInit()
	NBDebug("[NOOB BOT] Bot Loaded.")
	timer.Simple(3,function()
		RunConsoleCommand( "bot_resetconvar" )
	end)
end
hook.Add("Initialize","addonInit",addonInit)




