for i=1,10 do
data:extend({
	{
		type = "item",
		name = "element-group-"..i,
		localised_name = {"item-name.unverified-spectrogram",{"item-name.element-group-"..i}},
		localised_description = {"item-description.unverified-spectrogram"},
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/element-group-"..i..".png",
			},
		},
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		order = string.char(96+i),
		subgroup = "fundamental-physics-spectral-analysis",
		stack_size = 100,
	},
})
end

-- vanilla + bob ores
local ores = {"iron-ore", "copper-ore", "stone", "coal", "uranium-ore", "bauxite-ore", "cobalt-ore", "gold-ore", "lead-ore", "nickel-ore", "quartz", "rutile-ore", "silver-ore", "tin-ore", "tungsten-ore", "zinc-ore"}
local ore_results = {
{{8,8},{7,5},{5,3},{1,2},{3,1},{4,1}},
{{8,8},{7,6},{5,2},{1,2},{3,1},{4,1}},
{{1,8},{5,7},{7,3},{8,2},{6,2},{3,1}},
{{1,8},{5,7},{7,4},{8,3},{6,1},{4,1}},
{{10,8},{9,7},{4,6},{2,2},{8,1},{7,1}},
{{8,6},{7,6},{3,3},{4,3},{1,1},{6,1}},
{{8,8},{7,5},{5,4},{1,1},{3,1},{4,1}},
{{8,8},{7,5},{10,3},{9,2},{3,1},{4,1}},
{{7,8},{8,4},{5,4},{1,2},{3,1},{4,1}},
{{8,7},{7,6},{5,3},{1,2},{3,1},{4,1}},
{{5,7},{1,6},{6,4},{7,2},{8,1},{4,1}},
{{8,7},{7,5},{5,4},{1,2},{3,1},{4,1}},
{{8,8},{7,5},{3,3},{10,2},{9,1},{4,1}},
{{7,7},{8,5},{5,4},{1,2},{3,1},{4,1}},
{{8,7},{7,5},{10,4},{9,2},{3,1},{4,1}},
{{8,7},{7,6},{5,3},{1,2},{3,1},{4,1}},
}
for k,v in pairs(ores) do
	if data.raw.item[v] then
		local ore_icon = nil
		if k<=5 then
			ore_icon = "__base__/graphics/icons/"..v..".png"
		else
			ore_icon = "__bobores__/graphics/icons/"..v..".png"
		end
		local recipe = {
				type = "recipe",
				name = "spectral-analysis-"..v,
				localised_name = {"recipe-name.spectral-analysis",{"item-name."..v}},
				category = "facility",
				enabled = false,
				energy_required = 10,
				subgroup = "fundamental-physics-spectral-analysis",
				order = string.char(96+k),
				icons = {
					{
						icon = "__fundamental_physics__/graphics/item/spectral-analysis.png",
					},
					{
						icon = ore_icon,
						scale = 0.5,
					},
				},
				icon_size = 32,
				ingredients = {{v, 100}},
				results = {},
			}
		for k,v in pairs(ore_results[k]) do
			table.insert(recipe.results, {"element-group-"..v[1],v[2]})
		end
			
		if k<=5 then
			mylib.add_angel_num_icon(recipe,k)
		elseif k<=10 then
			mylib.add_angel_num_icon(recipe,5)
			mylib.add_angel_num_icon(recipe,k-5, 0)
		elseif k<=15 then
			mylib.add_angel_num_icon(recipe,5)
			mylib.add_angel_num_icon(recipe,5, 0)
			mylib.add_angel_num_icon(recipe,k-10, 0)
		elseif k<=20 then
			mylib.add_angel_num_icon(recipe,5)
			mylib.add_angel_num_icon(recipe,5, 0)
			mylib.add_angel_num_icon(recipe,5, 12)
			mylib.add_angel_num_icon(recipe,k-15, 24)
		end
		data:extend({recipe})
	end
end

-- lithia-water
if data.raw.fluid["lithia-water"] then 
local ore_results2 = {{3,8},{1,7},{4,4},{6,3},{2,2},{7,1}}
local recipe2 = {
    type = "recipe",
    name = "spectral-analysis-lithia",
    localised_name = {"recipe-name.spectral-analysis",{"fluid-name.lithia-water"}},
    category = "facility",
    enabled = false,
    energy_required = 10,
    subgroup = "fundamental-physics-spectral-analysis",
    order = string.char(96+#ores+1),
    icons = {
      {
        icon = "__fundamental_physics__/graphics/item/spectral-analysis.png",
      },
      {
        icon = "__bobores__/graphics/icons/lithia-water.png",
        scale = 0.5,
      },
    },
    icon_size = 32,
    ingredients = {{type="fluid", name="lithia-water", amount=1000},},
    results = {},
  }
for k,v in pairs(ore_results2) do
	table.insert(recipe2.results, {"element-group-"..v[1],v[2]})
end
data:extend({recipe2})
end

-- air
local air, air_icon = nil, nil
if data.raw.fluid["gas-compressed-air"] then 
	air = "gas-compressed-air"
	air_icon = "__angelspetrochem__/graphics/icons/gas-compressed-air.png"
elseif data.raw.fluid["liquid-air"] then 
	air = "liquid-air"
	air_icon = "__bobplates__/graphics/icons/liquid-air.png"
end
if air~=nil then
	local ore_results3 = {{2,8},{1,7},{6,4}}
	local recipe3 = {
		type = "recipe",
		name = "spectral-analysis-air",
		localised_name = {"recipe-name.spectral-analysis",{"fluid-name."..air}},
		category = "facility",
		enabled = false,
		energy_required = 10,
		subgroup = "fundamental-physics-spectral-analysis",
		order = string.char(96+#ores+2),
		icons = {
		  {
			icon = "__fundamental_physics__/graphics/item/spectral-analysis.png",
		  },
		  {
			icon = air_icon,
			scale = 0.5,
		  },
		},
		icon_size = 32,
		ingredients = {{type="fluid", name=air, amount=1000},},
		results = {},
	  }
	for k,v in pairs(ore_results3) do
		table.insert(recipe3.results, {"element-group-"..v[1],v[2]})
	end
	data:extend({recipe3})
end

-- generate spectrum -> report recipes
local amount_func = mylib.cal_amount_func(1,9)
for i=1,10 do
data:extend({
	{
		type = "recipe",
		name = "spectrogram-analysis-"..i,
		localised_name = {"recipe-name.spectral-analysis-2",{"item-name.element-group-"..i}},
		category = "fundamental-physics-standard-model",
		enabled = true,
		hidden = true,
		energy_required = 100,
		subgroup = "fundamental-physics-spectral-analysis",
		order = "a",
		icon_size = 32,
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/element-group-"..i..".png",
			},
		},
		ingredients = 
		{
			{"element-group-"..i, 50}
		},
		results = {
        {"research-report-1", mylib.cal_amount(i, 10, amount_func, 0.25, 0.5)},
        {"research-report-2", mylib.cal_amount(i, 10, amount_func, 0.4, 0.3)},
        {"research-report-3", mylib.cal_amount(i, 10, amount_func, 0.4, 0.2)},
        {"research-report-4", mylib.cal_amount(i, 10, amount_func, 0.5, 0.1)},
        {"research-report-5", mylib.cal_amount(i, 10, amount_func, 0.5, 0)},
      },
	}
})
mylib.add_productivity_limitation("spectrogram-analysis-"..i)
end