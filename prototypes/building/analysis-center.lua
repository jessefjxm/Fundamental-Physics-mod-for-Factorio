data:extend(
{
	{
		type = "recipe",
		name = "particle-physics-analysis-center-mk1",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
			{"basic-circuit-board", 20},
			{"stone-brick", 100}
		},
		result = "particle-physics-analysis-center-mk1"
	},
	
	{
		type = "recipe",
		name = "particle-physics-analysis-center-mk2",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
			{"particle-physics-analysis-center-mk1", 1},
			{"advanced-circuit", 20},
			{"iron-plate", 100},
			{"concrete", 100}
		},
		result = "particle-physics-analysis-center-mk2"
	},
	
	{
		type = "recipe",
		name = "particle-physics-analysis-center-mk3",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
			{"particle-physics-analysis-center-mk2", 1},
			{"advanced-processing-unit", 20},
			{"steel-plate", 100},
			{"refined-concrete", 100}
		},
		result = "particle-physics-analysis-center-mk3"
	},
})

for i=1,4 do
	local lab_item = {
		type = "item",
		name = "particle-physics-analysis-center-mk"..i,
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/facility.png",
			}
		},
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "fundamental-physics-lab",
		order = "a-a",
		place_result = "particle-physics-analysis-center-mk"..i,
		stack_size = 10,
	}
	mylib.add_angel_num_icon(lab_item,i)
	
	local lab = table.deepcopy(data.raw["furnace"]["electric-furnace"])
	lab.name = "particle-physics-analysis-center-mk"..i
	lab.fast_replaceable_group = "particle-physics-analysis-center"
	lab.module_specification.module_slots = i
	lab.icons = {
			{
				icon = "__fundamental_physics__/graphics/item/facility.png",
			}
		}
	mylib.add_angel_num_icon(lab,i)
	lab.crafting_categories = {"fundamental-physics-spectral-analysis", "fundamental-physics-standard-model"}
    lab.result_inventory_size = 7
	lab.minable.result = "particle-physics-analysis-center-mk"..i
	lab.max_health = 2*data.raw.lab["lab"].max_health
	lab.crafting_speed = i
	lab.animation =
		{
			filename = "__fundamental_physics__/graphics/entity/facility.png",
			priority = "high",
			width = 128,
			height = 128,
			frame_count = 29,
			line_length = 6,
			animation_speed = 1,
			shift = {0,-0.3}
		}
	lab.working_visualisations = nil
	lab.collision_box = {{-1.4, -1.4}, {1.4, 1.4}}
	lab.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
	lab.energy_usage = (2^i*10).."MW"
	
	data:extend({lab_item, lab})
end