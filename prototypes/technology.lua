-- classical-physics

data:extend({
  {
    type = "technology",
    name = "classical-physics",
    icon = "__fundamental_physics__/graphics/technology/classical-physics.png",
    icon_size = 128,
	effects = {},
    unit =
    {
      count_formula = "5",
      ingredients =
      {
        {"science-pack-1", 1},
      },
      time = 30
    },
    upgrade = false,
    order = "e-l-g"
  },
})
if data.raw.technology["basic-automation"] then
  mylib.add_prerequisite("basic-automation", "classical-physics")
else
  mylib.add_prerequisite("automation", "classical-physics")
end
if data.raw.technology["basic-logistics"] then
	mylib.add_prerequisite("basic-logistics", "classical-physics")
else
	mylib.add_prerequisite("logistics", "classical-physics")
end
if data.raw.recipe["facility-science-pack-1"] then
	mylib.add_prerequisite("facility-1", "classical-physics")
end
mylib.add_prerequisite("optics", "classical-physics")
for i=1,3 do
	table.insert(data.raw.technology["classical-physics"].effects,{
       type = "unlock-recipe",
        recipe = "research-report-integration-"..i
    })
	table.insert(data.raw.technology["classical-physics"].effects,{
       type = "unlock-recipe",
        recipe = "research-report-secondary-analysis-"..i
    })
end

-- spectral-analysis

data:extend({
  {
    type = "technology",
    name = "spectral-analysis-1",
    icon = "__fundamental_physics__/graphics/technology/spectral-analysis.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fundamental-physics-research-center-mk1"
      },
      {
        type = "unlock-recipe",
        recipe = "particle-physics-analysis-center-mk1"
      },
	  {
       type = "unlock-recipe",
        recipe = "research-report-integration-4"
		},{
       type = "unlock-recipe",
        recipe = "research-report-secondary-analysis-4"
    }
    },
    unit =
    {
      count_formula = "500",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 45
    },
    prerequisites = {"optics"},
    upgrade = true,
    max_level = "1",
    order = "e-l-g"
  },
  {
    type = "technology",
    name = "spectral-analysis-2",
    icon = "__fundamental_physics__/graphics/technology/spectral-analysis.png",
    icon_size = 256,
    effects =
    {
      {
        type = "laboratory-productivity",
        modifier = 0.02
      }
    },
    unit =
    {
      count_formula = "1000*L^(1.2)",
      ingredients =
      {
        {"research-report-1", 3},
        {"research-report-2", 2},
        {"research-report-3", 2},
        {"research-report-4", 1},
        {"research-report-5", 1},
      },
      time = 45
    },
    prerequisites = {"spectral-analysis-1"},
    upgrade = true,
    max_level = "infinite",
    order = "e-l-g"
  },
})
if data.raw.technology["facility-1"] then
	mylib.add_prerequisite("spectral-analysis-1", "facility-1")
else
	table.insert(data.raw.technology["spectral-analysis-1"].effects,{
       type = "unlock-recipe",
        recipe = "facility-mk1"
      })
end
for k,v in pairs(data.raw.recipe) do
	if string.sub(v.name, 1,17)=="spectral-analysis" then
	table.insert(data.raw.technology["spectral-analysis-1"].effects,{
       type = "unlock-recipe",
        recipe = v.name
    })
	end
end

-- standard-model

data:extend({
  {
    type = "technology",
    name = "standard-model-1",
    icon = "__fundamental_physics__/graphics/technology/standard-model.png",
    icon_size = 256,
    effects =
    {
      {
        type = "laboratory-productivity",
        modifier = 0.02
      },
      {
        type = "unlock-recipe",
        recipe = "fundamental-physics-research-center-mk2"
      },
      {
        type = "unlock-recipe",
        recipe = "particle-physics-analysis-center-mk2"
      },
      {
        type = "unlock-recipe",
        recipe = "particle-collision-10mev"
      },
      {
        type = "unlock-recipe",
        recipe = "particle-collision-100mev"
      },
	  {
       type = "unlock-recipe",
        recipe = "research-report-integration-5"
	},{
       type = "unlock-recipe",
        recipe = "research-report-secondary-analysis-5"
    }
    },
    unit =
    {
      count_formula = "1000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1}
      },
      time = 60
    },
    prerequisites = {"spectral-analysis-1"},
    upgrade = true,
    max_level = "1",
    order = "e-l-g"
  },
  {
    type = "technology",
    name = "standard-model-2",
    icon = "__fundamental_physics__/graphics/technology/standard-model.png",
    icon_size = 256,
    effects =
    {
      {
        type = "laboratory-productivity",
        modifier = 0.02
      },
      {
        type = "unlock-recipe",
        recipe = "particle-collision-1gev"
      },
      {
        type = "unlock-recipe",
        recipe = "particle-collision-10gev"
      },
      {
        type = "unlock-recipe",
        recipe = "particle-collision-100gev"
      },
      {
        type = "unlock-recipe",
        recipe = "particle-collision-250gev"
      },
	  {
        type = "unlock-recipe",
        recipe = "particle-accelerator-mk3"
      },
    },
    unit =
    {
      count_formula = "2000*L^(1.2)",
      ingredients =
      {
        {"research-report-1", 3},
        {"research-report-2", 3},
        {"research-report-3", 2},
        {"research-report-4", 2},
        {"research-report-5", 1},
        {"research-report-6", 1},
      },
      time = 60
    },
    prerequisites = {"standard-model-1"},
    upgrade = true,
    max_level = "2",
    order = "e-l-g"
  },
  {
    type = "technology",
    name = "standard-model-3",
    icon = "__fundamental_physics__/graphics/technology/standard-model.png",
    icon_size = 256,
    effects =
    {
      {
        type = "laboratory-productivity",
        modifier = 0.02
      }
    },
    unit =
    {
      count_formula = "2000*L^(1.2)",
      ingredients =
      {
        {"research-report-1", 3},
        {"research-report-2", 3},
        {"research-report-3", 2},
        {"research-report-4", 2},
        {"research-report-5", 1},
        {"research-report-6", 1},
      },
      time = 60
    },
    prerequisites = {"standard-model-2"},
    upgrade = true,
    max_level = "infinite",
    order = "e-l-g"
  },
})
if data.raw.technology["facility-1"] then
	mylib.add_prerequisite("standard-model-1", "facility-2")
	mylib.add_prerequisite("standard-model-1", "particle-accelerator-2")
else
	table.insert(data.raw.technology["standard-model-1"].effects,{
        type = "unlock-recipe",
        recipe = "facility-mk2"
      })
	table.insert(data.raw.technology["standard-model-2"].effects,{
        type = "unlock-recipe",
        recipe = "facility-mk3"
      })
	table.insert(data.raw.technology["standard-model-1"].effects,{
        type = "unlock-recipe",
        recipe = "particle-accelerator-mk1"
      })
	table.insert(data.raw.technology["standard-model-1"].effects,{
        type = "unlock-recipe",
        recipe = "particle-accelerator-mk2"
      })
end

-- deep-space-accelerator

data:extend({
  {
    type = "technology",
    name = "deep-space-accelerator",
    icon = "__fundamental_physics__/graphics/technology/deep-space-accelerator.png",
    icon_size = 256,
	effects = {
      {
        type = "unlock-recipe",
        recipe = "deep-space-accelerator"
      },      {
        type = "unlock-recipe",
        recipe = "fundamental-physics-research-center-mk3"
      },      {
        type = "unlock-recipe",
        recipe = "particle-physics-analysis-center-mk3"
      },	  {
        type = "unlock-recipe",
        recipe = "particle-accelerator-mk4"
      },{
       type = "unlock-recipe",
        recipe = "research-report-integration-6"
		},{
       type = "unlock-recipe",
        recipe = "research-report-secondary-analysis-6"
    }
    },
    unit =
    {
      count_formula = "5000",
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"production-science-pack", 1},
        {"high-tech-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    prerequisites = {"standard-model-2", "rocketry"},
    upgrade = false,
    order = "e-l-g"
  },
})

-- superstring-theory

data:extend({
  {
    type = "technology",
    name = "superstring-theory-1",
    icon = "__fundamental_physics__/graphics/technology/superstring-theory.png",
    icon_size = 128,
    effects =
    {
      {
        type = "laboratory-productivity",
        modifier = 0.02
      },
    },
    unit =
    {
      count_formula = "3000*L^(1.2)",
      ingredients =
      {
        {"research-report-1", 4},
        {"research-report-2", 4},
        {"research-report-3", 3},
        {"research-report-4", 3},
        {"research-report-5", 2},
        {"research-report-6", 2},
        {"research-report-7", 1},
      },
      time = 60
    },
    prerequisites = {"deep-space-accelerator"},
    upgrade = true,
    max_level = "infinite",
    order = "e-l-g"
  },
})
mylib.add_prerequisite("superstring-theory", "facility-3")
