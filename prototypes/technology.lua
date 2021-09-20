------------------
---- data.lua ----
------------------

-- Offshore pump 1
OSM.lib.technology.add_unlock("offshore-pump-1", "fluid-handling")

-- Offshore pump 2
local offshore_technology_pump =
{
	type = "technology",
	name = "offshore-pump-tech_2",
	icon_size = 256,
	icon_mipmaps = 4,
	icon = "__P-U-M-P-S__/graphics/technology/offshore-pump-2.png",
	prerequisites = {"fluid-handling"},
	effects ={{type = "unlock-recipe", recipe = "offshore-pump-2"}},
	unit =
	{
		count = 50,
		ingredients =
		{
			{name="automation-science-pack", amount = 1},
			{name="logistic-science-pack", amount = 1}
		},
		time = 30
	},
	order = "d-a-a"
}	data:extend({offshore_technology_pump})

-- Offshore pump 3
local offshore_technology_pump =
{
	type = "technology",
	name = "offshore-pump-tech_3",
	icon_size = 256,
	icon_mipmaps = 4,
	icon = "__P-U-M-P-S__/graphics/technology/offshore-pump-3.png",
	effects = {{type = "unlock-recipe", recipe = "offshore-pump-3"}},
	prerequisites = {"offshore-pump-tech_2", "advanced-electronics"},
	unit =
	{
		count = 75,
		ingredients =
		{
			{name = "automation-science-pack", amount = 1},
			{name = "logistic-science-pack", amount = 1},
			{name = "chemical-science-pack", amount = 1}
		},
		time = 30
	},
	order = "d-a-b"
}	data:extend({offshore_technology_pump})

-- Offshore pump 4
local offshore_technology_pump =
{
	type = "technology",
	name = "offshore-pump-tech_4",
	icon_size = 256,
	icon_mipmaps = 4,
	icon = "__P-U-M-P-S__/graphics/technology/offshore-pump-4.png",
	effects = {{type = "unlock-recipe", recipe = "offshore-pump-4"}},
	prerequisites = {"offshore-pump-tech_3", "advanced-electronics-2"},
	unit =
	{
		count = 100,
		ingredients =
			{
				{name = "automation-science-pack", amount = 1},
				{name = "logistic-science-pack", amount = 1},
				{name = "chemical-science-pack", amount = 1},
				{name = "production-science-pack", amount = 1}
			},
		time = 30
	},
	order = "d-a-b"
}	data:extend({offshore_technology_pump})

-- Water pumpjack
local ground_water_pumpjack =
{
	type = "technology",
	name = "water-pumpjack",
	icon_size = 256,
	icon_mipmaps = 4,
	icon = "__P-U-M-P-S__/graphics/technology/water-pumpjack.png",
    prerequisites = {},
    unit =
    {
		count = 10,
		time = 30,
		ingredients =
		{
			{name = "automation-science-pack", amount = 1}
		}
	},
    effects =
	{
		{type = "unlock-recipe", recipe = "water-pumpjack-1"}
	},
	order = "d-a-d-1",
}	data:extend({ground_water_pumpjack})