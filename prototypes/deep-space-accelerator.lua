-- deep space accelerator
local dsa_recipe = 
	{
		type = "recipe",
		name = "deep-space-accelerator",
		enabled = false,
		energy_required = 2,
		order = "z",
		ingredients =
		{
			{"low-density-structure", 100},
			{"particle-accelerator-mk2", 5}
		},
		result = "deep-space-accelerator"
	}
if data.raw.item["fusion-reactor-equipment-4"] then
	table.insert(dsa_recipe.ingredients, {"fusion-reactor-equipment-4", 10})
else
	table.insert(dsa_recipe.ingredients, {"fusion-reactor-equipment", 10})
end
if data.raw.item["radar-5"] then
	table.insert(dsa_recipe.ingredients, {"radar-5", 5})
else
	table.insert(dsa_recipe.ingredients, {"radar", 5})
end
if data.raw.item["advanced-processing-unit"] then
	table.insert(dsa_recipe.ingredients, {"advanced-processing-unit", 100})
else
	table.insert(dsa_recipe.ingredients, {"processing-unit", 100})
end

data:extend({dsa_recipe})

data:extend({
  {
    type = "item",
    name = "deep-space-accelerator",
    icon = "__fundamental_physics__/graphics/item/deep-space-accelerator.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "fundamental-physics-accelerator",
    order = "a[accelerator]",
    stack_size = 1,
    rocket_launch_product = {"research-report-7", 1}
  },
})