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