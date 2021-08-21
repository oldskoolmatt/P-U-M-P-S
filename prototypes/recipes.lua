------------------
---- data.lua ----
------------------

-- Burner offshore pump
local offshore_pump_0 =
{
	type = "recipe",
	name = "offshore-pump-0",
	ingredients =
	{
		{type = "item", name = "stone-brick", amount = 5},
		{type = "item", name = "pipe", amount = 1},
		{type = "item", name = "iron-gear-wheel", amount = 5}
	},
	result = "offshore-pump-0"
}	data:extend({offshore_pump_0})

-- Offshore pump 1
local offshore_pump_1 =
{
	type = "recipe",
	name = "offshore-pump-1",
	enabled = false,
	ingredients =
	{
		{type = "item", name = "electronic-circuit", amount = 2},
		{type = "item", name = "pipe", amount = 1},
		{type = "item", name = "iron-gear-wheel", amount = 5}
	},
	result = "offshore-pump-1"
}	data:extend({offshore_pump_1})

-- Offshore pump 2
local offshore_pump_2 =
{
	type = "recipe",
	name = "offshore-pump-2",
	enabled = false,
	ingredients =
	{																				-- BOB --
		{type = "item", name = "advanced-circuit", amount = 2},		--[[-------{"advanced-circuit"}-------]]
		{type = "item", name = "steel-plate", amount = 2},			--[[----------{"steel-pipe"}----------]]
		{type = "item", name = "iron-gear-wheel", amount = 5},		--[[-------{"steel-gear-wheel"}-------]]
	},
	result = "offshore-pump-2"
}	data:extend({offshore_pump_2})

-- Offshore pump 3
local offshore_pump_3 =
{
	type = "recipe",
	name = "offshore-pump-3",
	enabled = false,
	ingredients =
	{																				-- BOB --
		{type = "item", name = "advanced-circuit", amount = 2},		--[[-------{"processing-unit"}-------]]
		{type = "item", name = "steel-plate", amount = 4},			--[[--------{"titanium-pipe"}--------]]
		{type = "item", name = "iron-gear-wheel", amount = 5},		--[[-----{"titanium-gear-wheel"}-----]]
	},
	result = "offshore-pump-3"
}	data:extend({offshore_pump_3})

-- Offshore pump 4
local offshore_pump_4 =
{
	type = "recipe",
	name = "offshore-pump-4",
	enabled = false,
	ingredients =
	{																				-- BOB --
		{type = "item", name = "processing-unit", amount = 2},		--[[---{"advanced-processing-unit"}---]]
		{type = "item", name = "steel-plate", amount = 8},			--[[---------{"nitinol-pipe"}---------]]
		{type = "item", name = "iron-gear-wheel", amount = 5},		--[[------{"nitinol-gear-wheel"}------]]
	},
	result = "offshore-pump-4"
}	data:extend({offshore_pump_4})

-- Water pumpjack
local water_pumpjack =
{
	type = "recipe",
	name = "water-pumpjack-1",
	enabled = false,
	ingredients =
	{
		{type = "item", name = "iron-plate", amount = 10},
		{type = "item", name = "iron-gear-wheel", amount = 10},
		{type = "item", name = "pipe", amount = 10},
		{type = "item", name = "electronic-circuit", amount = 5},
	},
	result = "water-pumpjack-1"
}	data:extend({water_pumpjack})