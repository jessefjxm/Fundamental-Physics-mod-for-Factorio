data:extend(
	{
		{
			type = "font",
			name = "asc_font",
			from = "default",
			border = false,
			size = 13
		},
		{
			type = "font",
			name = "asc_font_bold",
			from = "default-bold",
			border = false,
			size = 15
		},
		{
			type = "font",
			name = "asc_font_small",
			from = "default",
			border = false,
			size = 13
		},
	}
)		

--------------------------------------------------------------------------------------
local default_gui = data.raw["gui-style"].default

default_gui.asc_frame_style = 
{
	type="frame_style",
	parent="frame",
	font="asc_font_bold",
	top_padding = 1,
	right_padding = 4,
	bottom_padding = 4,
	left_padding = 4,
	resize_row_to_width = true,
	resize_to_row_height = false,
	-- max_on_row = 1,
}

default_gui.vertical_asc_flow_style = 
{
	type = "vertical_flow_style",
	
	top_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	right_padding = 0,
	
	horizontal_spacing = 2,
	vertical_spacing = 0,
	resize_row_to_width = true,
	resize_to_row_height = false,
	max_on_row = 1,
	
	graphical_set = { type = "none" },
}

default_gui.horizontal_asc_flow_style = 
{
	type = "horizontal_flow_style",
	
	top_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	right_padding = 0,
	
	horizontal_spacing = 2,
	vertical_spacing = 0,
	resize_row_to_width = true,
	resize_to_row_height = false,
	max_on_row = 1,
	
	graphical_set = { type = "none" },
}

--------------------------------------------------------------------------------------
default_gui.asc_label_style =
{
	type="label_style",
	parent="label",
	font="asc_font",
	align = "left",
	default_font_color={r=1, g=1, b=1},
	hovered_font_color={r=1, g=1, b=1},
	top_padding = 0,
	right_padding = 1,
	bottom_padding = 0,
	left_padding = 1,
}

default_gui.asc_label_title_style =
{
	type="label_style",
	parent="asc_label_style",
	font="asc_font_bold",
	default_font_color={r=1, g=1, b=0.5},
	hovered_font_color={r=1, g=1, b=0.5},
}

default_gui.asc_button_style = 
{
	type="button_style",
	parent="button",
	font="asc_font_bold",
	align = "center",
	default_font_color={r=1, g=1, b=1},
	hovered_font_color={r=1, g=1, b=1},
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	left_click_sound =
	{
		{
		  filename = "__core__/sound/gui-click.ogg",
		  volume = 1
		}
	},
}

default_gui.asc_button = 
{
	type="button_style",
	parent="button",
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	width = 36,
	height = 36,
	scalable = false,
}

