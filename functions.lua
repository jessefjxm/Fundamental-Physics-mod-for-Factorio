if not mylib then mylib = {} end

function mylib.add_angel_num_icon(table_name, num)
	if angelsmods.petrochem and num<=5 then
		table.insert(table_name.icons, {
				icon = "__angelspetrochem__/graphics/icons/num_"..num..".png",
				tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
				scale = 0.32,
				shift = {-12, -12}
			})
	end
end