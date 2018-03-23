-- recipe
data:extend(
{
	{
		type = "recipe",
		name = "fundamental-physics-research-center-mk1",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{"basic-circuit-board", 20},
			{"stone-brick", 100}
		},
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/lab-1.png",
			}
		},
		result = "fundamental-physics-research-center-mk1"
	},
	
	{
		type = "recipe",
		name = "fundamental-physics-research-center-mk2",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{"fundamental-physics-research-center-mk1", 1},
			{"advanced-circuit", 20},
			{"iron-plate", 100},
			{"concrete", 100}
		},
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/lab-2.png",
			}
		},
		result = "fundamental-physics-research-center-mk2"
	},
	
	{
		type = "recipe",
		name = "fundamental-physics-research-center-mk3",
		enabled = false,
		energy_required = 40,
		ingredients =
		{
			{"fundamental-physics-research-center-mk2", 1},
			{"advanced-processing-unit", 20},
			{"steel-plate", 100},
			{"refined-concrete", 100}
		},
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/lab-3.png",
			}
		},
		result = "fundamental-physics-research-center-mk3"
	},
})

-- item & entity
for i=1,3 do
	local lab_item = table.deepcopy(data.raw["item"]["lab"])
	lab_item.name = "fundamental-physics-research-center-mk"..i
	lab_item.subgroup = "fundamental-physics-lab"
	lab_item.place_result = "fundamental-physics-research-center-mk"..i
	lab_item.icons = {
			{
				icon = "__fundamental_physics__/graphics/item/lab-"..i..".png",
			}
		}

	mylib.add_angel_num_icon(lab_item,i)
	
	local lab = table.deepcopy(data.raw["lab"]["lab"])
	lab.name = "fundamental-physics-research-center-mk"..i
	lab.fast_replaceable_group = "fundamental-physics-research-center"
	lab.minable.result = "fundamental-physics-research-center-mk"..i
	lab.max_health = (2^i)*data.raw.lab["lab"].max_health
	lab.module_specification.module_slots = i
	lab.energy_usage = (2^i*10).."MW"
	lab.on_animation =
    {
      filename = "__fundamental_physics__/graphics/entity/lab-"..i..".png",
      width = 113,
      height = 91,
      frame_count = 33,
      line_length = 11,
      animation_speed = 1 / 3,
      shift = {0.2, 0.15}
    }
    lab.off_animation =
    {
      filename = "__fundamental_physics__/graphics/entity/lab-"..i..".png",
      width = 113,
      height = 91,
      frame_count = 1,
      shift = {0.2, 0.15}
    }
	lab.inputs =
		{
		  "research-report-1",
		  "research-report-2",
		  "research-report-3",
		  "research-report-4",
		  "research-report-5",
		  "research-report-6",
		  "research-report-7",
	   }
	lab.researching_speed = i
	lab.icons = {
			{
				icon = "__fundamental_physics__/graphics/item/lab-"..i..".png"
			}
		}
	mylib.add_angel_num_icon(lab,i)
	
	data:extend({lab_item, lab})
end