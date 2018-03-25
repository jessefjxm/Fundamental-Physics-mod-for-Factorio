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
	local recipe = 	{
			type = "recipe",
			name = "research-report-integration-"..i,
			localised_name = {"recipe-name.research-report-integration",{"item-name.research-report-"..(i+1)}},
			category = "fundamental-physics-standard-model",
			enabled = true,
			subgroup = "fundamental-physics-research-report",
			energy_required = 10,
			ingredients = {
				{"research-report-"..i, 10},
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
					shift = {-6, 16}
				},
			},
			order = "a",
			result = "research-report-"..(i+1)
		}
	data:extend({recipe})
end