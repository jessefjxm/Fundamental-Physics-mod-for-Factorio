if not mylib then mylib = {} end

function mylib.add_angel_num_icon(table_name, num, x, y, ratio)
	if ratio==nil then ratio = 0.32 end
	if x==nil then x = -12 end
	if y==nil then y = -12 end
  if angelsmods and angelsmods.petrochem and num<=5 then
    table.insert(table_name.icons, {
      icon = "__angelspetrochem__/graphics/icons/num_"..num..".png",
      tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
      scale = ratio,
      shift = {x, y}
    })
  end
end

function mylib.add_prerequisite(technology, prerequisite)
  if bobmods and bobmods.lib then
    bobmods.lib.tech.add_prerequisite(technology, prerequisite)
    return
  end
  -- copy this method
  if data.raw.technology[technology] and data.raw.technology[prerequisite] then
    local addit = true
    if data.raw.technology[technology].prerequisites then
      for i, check in ipairs(data.raw.technology[technology].prerequisites) do
        if check == prerequisite then addit = false end
      end
    else
      data.raw.technology[technology].prerequisites = {}
    end
    if addit then table.insert(data.raw.technology[technology].prerequisites, prerequisite) end
  end
end


function mylib.add_productivity_limitation(recipe)
  if bobmods and bobmods.lib then
    bobmods.lib.module.add_productivity_limitation(recipe)
    return
  end
  -- copy this method
  if data.raw.recipe[recipe] then
    for i, module in pairs(data.raw.module) do
      if module.limitation and module.effect.productivity then
        table.insert(module.limitation, recipe)
      end
    end
  end
end

-- to generate a(actually 2) linear function that goes up then down
function mylib.cal_amount_func(min, max)
	local amount_func = {}
	for i=min,max do
		amount_func[#amount_func+1] = i
	end
	for i=max,min,-1 do
		amount_func[#amount_func+1] = i
	end
	return amount_func
end

-- get [ratio-th + diff] element in amount_func
-- e.g. [50% + 10] element in array amount_func
function mylib.cal_amount(k, list_size, amount_func, ratio, diff)
	return amount_func[math.ceil(k/list_size*ratio*#amount_func+diff*#amount_func)]
end