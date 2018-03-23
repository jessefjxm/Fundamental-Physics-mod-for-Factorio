data:extend(
{
  {
    type = "recipe-category",
    name = "fundamental-physics-spectral-analysis",
  },
  {
    type = "recipe-category",
    name = "fundamental-physics-standard-model",
  },
  {
    type = "recipe-category",
    name = "particle-accelerator-gev",
  },
  {
    type = "item-group",
    name = "fundamental-physics",
    order = "g",
    inventory_order = "g",
    icon = "__fundamental_physics__/graphics/category.png",
	icon_size = 256,
  },
  {
    type = "item-subgroup",
    name = "fundamental-physics-spectral-analysis",
	group = "fundamental-physics",
	order = "a",
  },
  {
    type = "item-subgroup",
    name = "fundamental-physics-standard-model",
	group = "fundamental-physics",
	order = "b",
  },
  {
    type = "item-subgroup",
    name = "fundamental-physics-accelerator",
	group = "fundamental-physics",
	order = "c",
  },
  {
    type = "item-subgroup",
    name = "fundamental-physics-research-report",
	group = "fundamental-physics",
	order = "d",
  },
  {
    type = "item-subgroup",
    name = "fundamental-physics-lab",
	group = "fundamental-physics",
	order = "e",
  },
}
)
if not data.raw["recipe-category"]["particle-accelerator"] then
data:extend(
{
  {
    type = "recipe-category",
    name = "particle-accelerator",
  },
  
 })
end