
NB_VERSION = "1.5"

local target = {}
target["#nb.target.player"] = {bot_target = "player"}
target["#nb.target.npc"] = {bot_target = "npc_*"}
target["#nb.target.prop"] = {bot_target = "Prop_*"}
target["#nb.target.hls.npc"] = {bot_target = "monster_*"}
target["#nb.target.all"] = {bot_target = "*"}
target["#nb.target.none"] = {bot_target = ""}

local ConVarsDefault = {
	bot_enabled = "1",
	bot_random_model = "0",
	bot_model = "models/player/kleiner.mdl",
	bot_random_color = "1",
	bot_target = "",
	bot_weapon = "weapon_smg1",
	bot_talk = "0",
	bot_cussing = "0",
	bot_allow_pickup_health = "0",
	bot_allow_pickup_battery = "0",
	bot_gundistance = "2500",
	bot_forwarddistance = "300",
	bot_backdistance = "150",
	bot_meddistance = "2500",
	bot_batdistance = "2500"
}
	
hook.Add("AddToolMenuTabs", "NB_ADDMENU", function()
	spawnmenu.AddToolCategory("Options", "NB Settings", "#nb.menu.nb_settings")
end)

hook.Add("PopulateToolMenu","NB_MENU",function()

	local weapons = {}
	for class,data in pairs(list.Get("Weapon")) do
		if(data.Spawnable || (data.AdminSpawnable && LocalPlayer():IsAdmin())) then
			weapons[data.PrintName .." - ("..class..")"] = {bot_weapon = class}
		end
	end
	spawnmenu.AddToolMenuOption("Options", "NB Settings", "NB_Settings", "#nb.menu.settings","","",function(pnl)
		if ( game.SinglePlayer() ) then
			pnl:ClearControls()
			pnl:AddControl( "label", { Text = "#nb.menu.single_player" } )
		else
			pnl:ClearControls()
			pnl:AddControl( "ComboBox", { MenuButton = 1, Folder = "noob", Options = { [ "#preset.default" ] = ConVarsDefault }, CVars = table.GetKeys( ConVarsDefault ) } )
			pnl:AddControl( "Button", { Label = "#nb.menu.add_bot", Command = "bot" } )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.enable_bot", Command = "bot_enabled" } )
			pnl:ControlHelp( "#nb.menu.enable_bot_desc" )
			//pnl:AddControl( "CheckBox", { Label = "#nb.menu.bot_attack_friendly_npc", Command = "bot_attack_friendly_npcs" } )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.random_models", Command = "bot_random_model" } )
			pnl:ControlHelp( "#nb.menu.random_models_desc" )
			pnl:AddControl( "textbox", { Label = "#nb.menu.use_model", Command = "bot_model" } )
			pnl:AddControl( "Button", { Label = "#nb.menu.get_model", Command = "bot_get_model" } )
			pnl:ControlHelp( "#nb.menu.use_model_desc" )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.random_colors", Command = "bot_random_color" } )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.talk", Command = "bot_talk" } )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.cussing", Command = "bot_cussing" } )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.pickup_meds", Command = "bot_allow_pickup_health" } )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.pickup_bats", Command = "bot_allow_pickup_battery" } )
			pnl:AddControl( "CheckBox", { Label = "#nb.menu.Alt_fire", Command = "bot_alt_firemode" } )
			pnl:AddControl( "ComboBox", { Label = "#nb.menu.bot_weapon", Options = weapons } )
			pnl:AddControl( "Button", { Label = "#nb.menu.get_weapon", Command = "bot_get_weapon" } )
			pnl:ControlHelp( "#nb.menu.get_weapon_desc" )
			pnl:AddControl( "ComboBox", { Label = "#nb.menu.bot_target", Options = target } )
			pnl:AddControl( "Slider", { Label = "#nb.menu.bot_detect_dist", Type = "Integer", Command = "bot_gundistance", Min = "0", Max = "5000" } )
			pnl:AddControl( "Slider", { Label = "#nb.menu.bot_chase_dist", Type = "Integer", Command = "bot_forwarddistance", Min = "0", Max = "1000" } )
			pnl:AddControl( "Slider", { Label = "#nb.menu.bot_dodge_dist", Type = "Integer", Command = "bot_backdistance", Min = "0", Max = "1000" } )
			pnl:AddControl( "Slider", { Label = "#nb.menu.bot_med_detect_dist", Type = "Integer", Command = "bot_meddistance", Min = "0", Max = "5000" } )
			pnl:AddControl( "Slider", { Label = "#nb.menu.bot_bat_detect_dist", Type = "Integer", Command = "bot_batdistance", Min = "0", Max = "5000" } )
			pnl:AddControl( "Button", { Label = "#nb.menu.reset_commands", Command = "bot_resetconvar" } )
		end
	end)
	
	spawnmenu.AddToolMenuOption("Options", "NB Settings", "NB_About", "#nb.menu.about","","",function(pnl)
	pnl:ClearControls()
	pnl:AddControl( "label", { Text = "#nb.menu.about.about_nb" } )
	pnl:ControlHelp( "#nb.menu.about.message" )
	pnl:AddControl( "label", { Text = "#nb.menu.about.mod_information" } )
	pnl:ControlHelp( language.GetPhrase("#nb.menu.about.version").." " ..NB_VERSION )
	pnl:ControlHelp( "#nb.menu.about.translator" )
	pnl:ControlHelp( "" )
	pnl:AddControl( "label", { Text = "#nb.menu.about.credits" } )
	pnl:ControlHelp( "Noobz4Life & nubz4lif - " ..language.GetPhrase("#nb.menu.about.credits.Noobz4Life") )
	pnl:ControlHelp( "Insane Black Rock Shooter (me) - " ..language.GetPhrase("#nb.menu.about.credits.IBRS") )
	pnl:ControlHelp( "NextKuromeThe76Soldier - " ..language.GetPhrase("#nb.menu.about.credits.NKT76S") )
	end)
	
	spawnmenu.AddToolMenuOption("Options", "NB Settings", "NB_Debug", "#nb.menu.debug","","",function(pnl)
	pnl:ClearControls()
	pnl:AddControl( "CheckBox", { Label = "#nb.menu.debug_mode", Command = "bot_nb_debug" } )
	end)
end)