------------------
---- data.lua ----
------------------

-- Water category and recipe
local offshore_water_category =
{
	name = "pump-water",
	type = "recipe-category"
}
local offshore_water_recipe =
{
	type = "recipe",
	name = "pump-water",
	category = "pump-water",
	hidden = true,
	hide_from_stats = false,	
	icon = "__P-U-M-P-S__/graphics/icons/empty.png",
	icon_size = 32,
	energy_required = 1,
	ingredients = {},
	results =
	{
		{
			type = "fluid",
			name = "water",
			amount = 300
		}
	},
	subgroup = "fluid-recipes"
}

-- Burner offshore pump
local offshore_recipe_pump_0 =
{
	type = "recipe",
	name = "offshore-pump-0",
	ingredients =
	{
		{"stone-brick", 5},
		{"pipe", 1},
		{"iron-gear-wheel", 5}
	},
	result = "offshore-pump-0"
}

-- Offshore pump 1
local offshore_recipe_pump_1 =
{
	type = "recipe",
	name = "offshore-pump-1",
	enabled = false,
	ingredients =
	{
		{"electronic-circuit", 2},
		{"pipe", 1},
		{"iron-gear-wheel", 5}
	},
	result = "offshore-pump-1"
}

-- Offshore pump 2
local offshore_recipe_pump_2 =
{
	type = "recipe",
	name = "offshore-pump-2",
	enabled = false,
	ingredients =
	{												-- BOB --
		{"advanced-circuit", 2},	--[[-------{"advanced-circuit"}-------]]
		{"steel-plate", 2},			--[[----------{"steel-pipe"}----------]]
		{"iron-gear-wheel", 5},		--[[-------{"steel-gear-wheel"}-------]]
	},
	result = "offshore-pump-2"
}

-- Offshore pump 3
local offshore_recipe_pump_3 =
{
	type = "recipe",
	name = "offshore-pump-3",
	enabled = false,
	ingredients =
	{												-- BOB --
		{"advanced-circuit", 2},	--[[-------{"processing-unit"}-------]]
		{"steel-plate", 4},			--[[--------{"titanium-pipe"}--------]]
		{"iron-gear-wheel", 5},		--[[-----{"titanium-gear-wheel"}-----]]
	},
	result = "offshore-pump-3"
}

-- Offshore pump 4
local offshore_recipe_pump_4 =
{
	type = "recipe",
	name = "offshore-pump-4",
	enabled = false,
	ingredients =
	{												-- BOB --
		{"processing-unit", 2},		--[[---{"advanced-processing-unit"}---]]
		{"steel-plate", 8},			--[[---------{"nitinol-pipe"}---------]]
		{"iron-gear-wheel", 5},		--[[------{"nitinol-gear-wheel"}------]]
	},
	result = "offshore-pump-4"
}

data:extend
({
	offshore_water_category,
	offshore_water_recipe,
	offshore_recipe_pump_0,
	offshore_recipe_pump_1,
	offshore_recipe_pump_2,
	offshore_recipe_pump_3,
	offshore_recipe_pump_4
})