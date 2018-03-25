local ing = {
  {
    {"basic-circuit-board", 20},
    {"pipe", 20},
    {"stone-brick", 100}
  },
  {
    {"facility-mk1", 1},
    {"advanced-circuit", 20},
    {"concrete", 100}
  },
  {
    {"facility-mk2", 1},
    {"advanced-processing-unit", 20},
    {"refined-concrete", 100}
  },
}
if bobmods and bobmods.plates then
  table.insert(ing[2], {"brass-pipe", 100})
  table.insert(ing[3], {"tungsten-pipe", 100})
else
  table.insert(ing[2], {"pipe", 100})
  table.insert(ing[3], {"pipe", 100})
end

for i=1,3 do
  if not data.raw.recipe["facility-mk"..i] then
    local recipe =
    {
      type = "recipe",
      name = "facility-mk"..i,
      enabled = false,
      energy_required = 2,
      ingredients = ing[i],
      result = "facility-mk"..i
    }
    local item = {
      type = "item",
      name = "facility-mk"..i,
      icons =
      {
        {
          icon = "__fundamental_physics__/graphics/item/facility.png"
        }
      },
      icon_size = 32,
      flags = {"goes-to-quickbar"},
	  subgroup = "fundamental-physics-spectral-analysis",
      order = "a-a",
      place_result = "facility-mk"..i,
      stack_size = 10,
    }
    local entity = {
      type = "assembling-machine",
      name = "facility-mk"..i,
      fast_replaceable_group = "facility",
      icons =
      {
        {
          icon = "__fundamental_physics__/graphics/item/facility.png"
        }
      },
      icon_size = 32,
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {hardness = 0.8, mining_time = 1.2, result = "facility-mk"..i},
      max_health = 500,
      corpse = "medium-remnants",
      dying_explosion = "medium-explosion",
      light = {intensity = 1, size = 100},--int = 0.75, s = 8
      resistances =
      {
        {
          type = "fire",
          percent = 70
        }
      },
      collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      animation =
      {
        filename = "__fundamental_physics__/graphics/entity/facility.png",
        priority = "high",
        width = 128,
        height = 128,
        frame_count = 29,
        line_length = 6,
        animation_speed = 1,
        shift = {0,-0.3}
      },
      crafting_categories = {"facility"},
      crafting_speed = i, 
      module_specification =
      {
        module_slots = i+1
      },
      allowed_effects = {"consumption", "speed", "pollution"},
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.001
      },
      energy_usage = (4*2^(i-1)).."MW",
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
      },
      fluid_boxes =
      {
        {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{ type="input", position = {-1, -1.8} }}
        },
        {
          production_type = "input",
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{ type="input", position = {1, -1.8} }}
        }
      }
    }
	mylib.add_angel_num_icon(item,i)
	mylib.add_angel_num_icon(entity,i)
	
	data:extend({recipe, item, entity})
  end
end