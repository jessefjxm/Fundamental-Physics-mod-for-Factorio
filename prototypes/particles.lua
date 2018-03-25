local list = {"proton", "neutron", "electron", "anti-electron", "anti-proton","muon", "up-quark", "down-quark", "photon", "strange-quark", "electron-neutrino", "muon-neutrino", "tauon", "charm-quark", "bottom-quark", "tau-neutrino", "w-boson", "z-boson", "top-quark", "gluon", "higgs-boson"}

for k,v in pairs(list) do
data:extend({
	{
		type = "item",
		name = v,
		localised_name = {"item-name.possible_collision_case",{"item-name."..v}},
		localised_description = {"item-description.possible_collision_case"},
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/"..v..".png",
			},
		},
		icon_size = 32,
		order = string.char(96+k),
		flags = {"goes-to-quickbar"},
		subgroup = "fundamental-physics-standard-model",
		stack_size = 100,
	},
})
end

data:extend({
	{
		type = "recipe",
		name = "particle-collision-10mev",
		category = "particle-accelerator",
		enabled = false,
		energy_required = 10,
		subgroup = "fundamental-physics-standard-model",
		order = "a",
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/accelerator.png",
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[1]..".png",
				scale = 0.5,
				shift = {-10, 12}
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[3]..".png",
				scale = 0.5,
				shift = {10, 12}
			},
		},
		icon_size = 32,
		ingredients = {},
		results = {
        {list[1], 8},
        {list[2], 6},
        {list[3], 8},
        {list[4], 2},
        {list[5], 1},
      },
	},
	{
		type = "recipe",
		name = "particle-collision-100mev",
		category = "particle-accelerator",
		enabled = false,
		energy_required = 15,
		subgroup = "fundamental-physics-standard-model",
		order = "b",
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/accelerator.png",
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[6]..".png",
				scale = 0.5,
				shift = {-10, 12}
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[7]..".png",
				scale = 0.5,
				shift = {10, 12}
			},
		},
		icon_size = 32,
		ingredients = {},
		results = {
        {list[6], 6},
        {list[7], 4},
        {list[8], 2},
        {list[9], 1},
      },
	},
	{
		type = "recipe",
		name = "particle-collision-1gev",
		category = "particle-accelerator-gev",
		enabled = false,
		energy_required = 20,
		subgroup = "fundamental-physics-standard-model",
		order = "c",
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/accelerator.png",
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[10]..".png",
				scale = 0.5,
				shift = {-10, 12}
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[11]..".png",
				scale = 0.5,
				shift = {10, 12}
			},
		},
		icon_size = 32,
		ingredients = {},
		results = {
        {list[10], 5},
        {list[11], 4},
        {list[12], 2},
        {list[13], 1},
      },
	},
	{
		type = "recipe",
		name = "particle-collision-10gev",
		category = "particle-accelerator-gev",
		enabled = false,
		energy_required = 25,
		subgroup = "fundamental-physics-standard-model",
		order = "d",
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/accelerator.png",
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[15]..".png",
				scale = 0.5,
				shift = {-10, 12}
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[16]..".png",
				scale = 0.5,
				shift = {10, 12}
			},
		},
		icon_size = 32,
		ingredients = {},
		results = {
        {list[14], 6},
        {list[15], 4},
        {list[16], 1},
      },
	},
	{
		type = "recipe",
		name = "particle-collision-100gev",
		category = "particle-accelerator-gev",
		enabled = false,
		energy_required = 30,
		subgroup = "fundamental-physics-standard-model",
		order = "e",
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/accelerator.png",
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[18]..".png",
				scale = 0.5,
				shift = {-10, 12}
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[19]..".png",
				scale = 0.5,
				shift = {10, 12}
			},
		},
		icon_size = 32,
		ingredients = {},
		results = {
        {list[17], 6},
        {list[18], 4},
        {list[19], 1},
        {list[20], 1},
      },
	},
	{
		type = "recipe",
		name = "particle-collision-250gev",
		category = "particle-accelerator-gev",
		enabled = false,
		energy_required = 40,
		subgroup = "fundamental-physics-standard-model",
		order = "f",
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/accelerator.png",
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[21]..".png",
				scale = 0.5,
				shift = {-10, 12}
			},
			{
				icon = "__fundamental_physics__/graphics/item/"..list[20]..".png",
				scale = 0.5,
				shift = {10, 12}
			},
		},
		icon_size = 32,
		ingredients = {},
		results = {
        {list[20], 2},
        {list[21], 1},
      },
	},
})
mylib.add_angel_num_icon(data.raw.recipe["particle-collision-10mev"],1)
mylib.add_angel_num_icon(data.raw.recipe["particle-collision-100mev"],2)
mylib.add_angel_num_icon(data.raw.recipe["particle-collision-1gev"],3)
mylib.add_angel_num_icon(data.raw.recipe["particle-collision-10gev"],4)
mylib.add_angel_num_icon(data.raw.recipe["particle-collision-100gev"],5)
mylib.add_angel_num_icon(data.raw.recipe["particle-collision-250gev"],6)

-- generate collision case -> report recipes
local amount_func = mylib.cal_amount_func(1,10)
for k,v in pairs(list) do
data:extend({
	{
		type = "recipe",
		name = "standard-model-"..v,
		localised_name = {"recipe-name.standard-model-analysis",{"item-name."..v}},
		category = "fundamental-physics-standard-model",
		enabled = true,
		hidden = true,
		energy_required = 100,
		subgroup = "fundamental-physics-standard-model",
		order = "a",
		icon_size = 32,
		icons = {
			{
				icon = "__fundamental_physics__/graphics/item/research-report-"..math.floor(k/#list*6+1)..".png",
			},
		},
		ingredients = 
		{
			{v, 50}
		},
		results = {
        {"research-report-2", mylib.cal_amount(k, #list, amount_func, 0.5, 0.5)},
        {"research-report-3", mylib.cal_amount(k, #list, amount_func, 0.5, 0.3)},
        {"research-report-4", mylib.cal_amount(k, #list, amount_func, 0.5, 0.2)},
        {"research-report-5", mylib.cal_amount(k, #list, amount_func, 0.5, 0.1)},
        {"research-report-6", mylib.cal_amount(k, #list, amount_func, 0.5, 0)},
      },
	}
})
mylib.add_productivity_limitation("standard-model-"..v)
end