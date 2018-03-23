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
			remote.call("silo_script","set_show_launched_without_satellite", false)
			event.rocket_silo.get_output_inventory().insert({name="research-report-7", count=global.deep_space_accelerator})
			global.deep_space_accelerator = global.deep_space_accelerator + event.rocket.get_item_count("deep-space-accelerator")
		elseif event.rocket.force.recipes["compressed-deep-space-accelerator"] and event.rocket.get_item_count("compressed-deep-space-accelerator") > 0 then
			remote.call("silo_script","set_show_launched_without_satellite", false)
			event.rocket_silo.get_output_inventory().insert({name="research-report-7", count=global.deep_space_accelerator})
			global.deep_space_accelerator = global.deep_space_accelerator + event.rocket.get_item_count("compressed-deep-space-accelerator")
		end
	end
end)