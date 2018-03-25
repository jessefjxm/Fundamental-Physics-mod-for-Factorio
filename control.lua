script.on_init(function()
	global.deep_space_accelerator = 0
end)

script.on_load(function()
	if global.deep_space_accelerator == nil then
		global.deep_space_accelerator = 0
	end
end)

script.on_configuration_changed(function(data)
	if global.deep_space_accelerator ~= nil and global.deep_space_accelerator>0 then
		setup_gui(false)
	end
end)

script.on_event(defines.events.on_rocket_launched, function(event)
	if string.sub(event.rocket_silo.name, -11)=="rocket-silo" then
		if event.rocket.get_item_count("deep-space-accelerator") > 0 then
			launch(event, "deep-space-accelerator", "research-report-7")
		elseif event.rocket.force.recipes["compressed-deep-space-accelerator"] and event.rocket.get_item_count("compressed-deep-space-accelerator") > 0 then
			launch(event, "compressed-deep-space-accelerator", "compressed-research-report-7")
		end
	end
end)

local sizes = {1,10,100,1000,10000,100000,1000000,10000000,100000000}
local energy_levels = {"---","1Tev","10Tev","100Tev","1Pev","10Pev","100Pev","1Eev","10Eev"}

function launch(event, item, reward)
	remote.call("silo_script","set_show_launched_without_satellite", false)
	local old_count = global.deep_space_accelerator
	global.deep_space_accelerator = old_count + event.rocket.get_item_count(item)
	
	local reports = global.deep_space_accelerator*(feedback_bonus())
	if reports>0 then
		event.rocket_silo.get_output_inventory().insert({name=reward, count=reports})
	end
		
	for k,v in pairs(sizes) do
		if old_count < v and global.deep_space_accelerator >= v then
			for _a, player in pairs(game.players) do
				player.print{"message.deep-space-accelerator-"..v,energy_levels[k]}
			end
			if v==1 then
				setup_gui(true)
			end
			break
		end
	end

	for _, player in pairs(game.players) do
		if player.connected then
			update_gui(player)
		end
	end
end

function num_length(num)
	if num==0 then
		return 0
	else
		return math.floor(math.log10(global.deep_space_accelerator))
	end
end
function feedback_bonus()
	return 2^(num_length(global.deep_space_accelerator))
end
-- gui related
function setup_gui(check_online)
	for _, player in pairs(game.players) do
		if not check_online or player.connected then
			build_bar(player)
		end
	end
end

function build_bar(player)
	if player.gui.top.dsc_button ~= nil then
		player.gui.top.dsc_button.destroy()
	end
	
	player.gui.top.add({type = "sprite-button", name = "dsc_button", sprite = "item/deep-space-accelerator", style = "asc_button", tooltip = {"dsa_count_title"}})
end

function build_gui( player )
	if player.gui.left.deep_space_accelerator == nil then
		local gui1 = player.gui.left.add({type = "frame", name = "deep_space_accelerator", direction = "vertical", style = "asc_frame_style"})
		gui1.add({type = "flow", name = "dsa_count", direction = "vertical", style = "vertical_asc_flow_style"})
		gui1.add({type = "label", name = "dsa_count_title", caption = {"dsa_count_title"}, style = "asc_label_title_style"})
		gui1.add({type = "label", name = "dsa_count_number", caption = {"dsa_count_number",global.deep_space_accelerator}, style = "asc_label_style"})			
		gui1.add({type = "label", name = "dsa_network_level", caption = {"dsa_network_level",{"dsa_network_level_"..(num_length(global.deep_space_accelerator)+1)}}, style = "asc_label_style"})			
		gui1.add({type = "label", name = "dsa_energy_level", caption = {"dsa_energy_level",energy_levels[num_length(global.deep_space_accelerator)+1]}, style = "asc_label_style"})			
		gui1.add({type = "label", name = "dsa_reward_bonus", caption = {"dsa_reward_bonus",feedback_bonus()}, style = "asc_label_style"})	
	end
end

function update_gui( player )
	if player.gui.left.deep_space_accelerator == nil then return end
	player.gui.left.deep_space_accelerator.dsa_count_number.caption = {"dsa_count_number",global.deep_space_accelerator}
	player.gui.left.deep_space_accelerator.dsa_network_level.caption = {"dsa_network_level",{"dsa_network_level_"..(num_length(global.deep_space_accelerator)+1)}}	
	player.gui.left.deep_space_accelerator.dsa_energy_level.caption = {"dsa_energy_level",energy_levels[num_length(global.deep_space_accelerator)+1]}		
	player.gui.left.deep_space_accelerator.dsa_reward_bonus.caption = {"dsa_reward_bonus",feedback_bonus()}		
end

function on_gui_click(event)
	local player = game.players[event.player_index]

	if event.element.name == "dsc_button" then
		if player.gui.left.deep_space_accelerator == nil then
			build_gui(player)
			update_gui(player)
		else
			player.gui.left.deep_space_accelerator.destroy()
		end
	end
end

script.on_event(defines.events.on_gui_click, on_gui_click)
script.on_event(defines.events.on_gui_checked_state_changed, on_gui_click)
