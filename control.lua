script.on_init(function()
	global.deep_space_accelerator = 0
end)

script.on_load(function()
	if global.deep_space_accelerator == nil then
		global.deep_space_accelerator = 0
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

function launch(event, item, reward)
	remote.call("silo_script","set_show_launched_without_satellite", false)
	local old_count = global.deep_space_accelerator
	global.deep_space_accelerator = old_count + event.rocket.get_item_count(item)
	
	local reports = global.deep_space_accelerator*(2^math.floor(math.log10(global.deep_space_accelerator)))
	if reports>0 then
		event.rocket_silo.get_output_inventory().insert({name=reward, count=reports})
	end
		
	for k,v in pairs({1,10,100,1000,10000,100000,1000000,10000000,100000000}) do
		if old_count < v and global.deep_space_accelerator >= v then
			for _a, player in pairs(game.players) do
				player.print{"message.deep-space-accelerator-"..v}
			end
			break
		end
	end
end