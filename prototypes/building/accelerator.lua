-- on ground accelerator
local pa_ing = {
{
	{"processing-unit", 100},
	{"steel-plate", 100},
	{"pipe", 100},
	{"stone-brick", 100}
},
{
	{"particle-accelerator-mk1", 1},
	{"advanced-processing-unit", 100},
	{"stone-brick", 100}
},
{
	{"particle-accelerator-mk2", 1},
	{"advanced-processing-unit", 200},
	{"concrete", 100}
},
{
	{"particle-accelerator-mk3", 1},
	{"advanced-processing-unit", 400},
	{"refined-concrete", 100}
},
}
if bobmods and bobmods.plates then
	table.insert(pa_ing[1], {"iron-gear-wheel", 100})
	table.insert(pa_ing[2], {"cobalt-plate", 100})
	table.insert(pa_ing[2], {"cobalt-steel-gear-wheel", 100})
	table.insert(pa_ing[2], {"steel-pipe", 100})
	table.insert(pa_ing[3], {"titanium-plate", 100})
	table.insert(pa_ing[3], {"titanium-gear-wheel", 100})
	table.insert(pa_ing[3], {"titanium-pipe", 100})
	table.insert(pa_ing[4], {"tungsten-plate", 100})
	table.insert(pa_ing[4], {"tungsten-gear-wheel", 100})
	table.insert(pa_ing[4], {"tungsten-pipe", 100})
else
	table.insert(pa_ing[2], {"steel-plate", 100})
	table.insert(pa_ing[2], {"pipe", 100})
	table.insert(pa_ing[3], {"steel-plate", 100})
	table.insert(pa_ing[3], {"pipe", 100})
	table.insert(pa_ing[4], {"steel-plate", 100})
	table.insert(pa_ing[4], {"pipe", 100})
end

for i=1,4 do
	if not data.raw.item["particle-accelerator-mk"..i] then
	local recipe = 	{
			type = "recipe",
			name = "particle-accelerator-mk"..i,
			enabled = false,
			energy_required = 10,
			ingredients = pa_ing[i],
			order = "a",
			result = "particle-accelerator-mk"..i
		}
	local item = {
			type = "item",
			name = "particle-accelerator-mk"..i,
			fast_replaceable_group = "particle-accelerator",
			icons =
			{
				{
					icon = "__fundamental_physics__/graphics/item/particle-accelerator-"..i..".png"
				},
			},
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "fundamental-physics-accelerator",
			order = "b-a",
			place_result = "particle-accelerator-mk"..i,
			stack_size = 10,
		}
	local entity = {
			type = "assembling-machine",
			name = "particle-accelerator-mk"..i,
			fast_replaceable_group = "particle-accelerator",
			icons =
			{
				{
					icon = "__fundamental_physics__/graphics/item/particle-accelerator-"..i..".png"
				},
			},
			icon_size = 32,
			flags = {"placeable-neutral", "placeable-player", "player-creation"},
			minable = {hardness = 0.8, mining_time = 1.2, result = "particle-accelerator-mk"..i},
			max_health = 500*i,
			corpse = "big-remnants",
			dying_explosion = "big-explosion",
			light = {intensity = 1, size = 100},--int = 0.75, s = 8
			resistances =
			{
				{
				type = "fire",
				percent = 70
				}
			},
			collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
			selection_box = {{-3, -3}, {3, 3}},
			animation = 
			{
				filename = "__fundamental_physics__/graphics/entity/particle-accelerator-"..i..".png",
				priority = "high",
				width = 256,
				height = 256,
				frame_count = 30,
				line_length = 6,
				animation_speed = 1,
				shift = {0,0}
			},
			crafting_categories = {"particle-accelerator"},
			crafting_speed = i,
			module_specification =
			{
				module_slots = i
			},
			allowed_effects = {"consumption", "speed", "pollution"},
			energy_source =
			{
				type = "electric",
				usage_priority = "secondary-input",
				emissions = 0
			},
			energy_usage = (500*i).."MW",
			ingredient_count = 2,
			open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
			close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
			vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
			working_sound =
			{
				sound = 
				{
					{
					  filename = "__base__/sound/assembling-machine-t1-1.ogg",
					  volume = 0.8
					},
					{
					  filename = "__base__/sound/assembling-machine-t1-2.ogg",
					  volume = 0.8
					},
				},
				idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.6},
				apparent_volume = 1.5,
			}
		}
	if i>=3 then
		table.insert(entity.crafting_categories, "particle-accelerator-gev")
	end
	mylib.add_angel_num_icon(item,i)
	mylib.add_angel_num_icon(entity,i)
	
	data:extend({recipe, item, entity})
	else
		data.raw.item["particle-accelerator-mk"..i].icons[1].icon = "__fundamental_physics__/graphics/item/particle-accelerator-"..i..".png"
		local pa_entity = data.raw["assembling-machine"]["particle-accelerator-mk"..i]
		pa_entity.icons[1].icon = "__fundamental_physics__/graphics/item/particle-accelerator-"..i..".png"
		pa_entity.animation.filename = "__fundamental_physics__/graphics/entity/particle-accelerator-"..i..".png"
	end
end