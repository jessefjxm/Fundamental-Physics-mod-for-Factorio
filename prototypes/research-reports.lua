for i=1,7 do
	local report = {
		type = "tool",
		name = "research-report-"..i,
		icon = "__fundamental_physics__/graphics/item/research-report-"..i..".png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "fundamental-physics-research-report",
		order = "a",
		stack_size = 100,
		durability = 1,
		durability_description_key = "description.science-pack-remaining-amount-key",
		durability_description_value = "description.science-pack-remaining-amount-value"
	}
	data:extend({report})
end

for i=1,6 do
	local recipeup = 	{
			type = "recipe",
			name = "research-report-integration-"..i,
			localised_name = {"recipe-name.research-report-integration",{"item-name.research-report-"..(i+1)}},
			category = "fundamental-physics-standard-model",
			enabled = false,
			subgroup = "fundamental-physics-research-report",
			energy_required = 10,
			ingredients = {
				{"research-report-"..i, 5},
			},
			icons = {
				{
					icon = "__fundamental_physics__/graphics/item/research-report-"..(i+1)..".png",
				},
				{
					icon = "__fundamental_physics__/graphics/item/research-report-"..i..".png",
					scale = 0.4,
					shift = {-16, 16}
				},
				{
					icon = "__fundamental_physics__/graphics/item/research-report-"..i..".png",
					scale = 0.4,
					shift = {-4, 16}
				},
				{
					icon = "__fundamental_physics__/graphics/item/research-report-"..i..".png",
					scale = 0.4,
					shift = {8, 16}
				},
			},
			icon_size = 32,
			always_show_products = true,
			order = "a",
			result = "research-report-"..(i+1)
		}
		
	local recipedown = 	{
			type = "recipe",
			name = "research-report-secondary-analysis-"..i,
			localised_name = {"recipe-name.research-report-secondary-analysis",{"item-name.research-report-"..i}},
			category = "facility",
			enabled = false,
			subgroup = "fundamental-physics-research-report-2",
			energy_required = 10,
			ingredients = {
				{"research-report-"..(i+1), 1},
			},
			icons = {
				{
					icon = "__fundamental_physics__/graphics/item/research-report-"..i..".png",
				},
				{
					icon = "__fundamental_physics__/graphics/item/research-report-"..i..".png",
					scale = 0.75,
					shift = {8, 0}
				},
				{
					icon = "__fundamental_physics__/graphics/item/research-report-"..(i+1)..".png",
					scale = 0.5,
					shift = {-12, 12}
				},
			},
			icon_size = 32,
			order = "b",
			results = {
				{"research-report-"..i, 2},
			  },
		}
	data:extend({recipeup, recipedown})
end