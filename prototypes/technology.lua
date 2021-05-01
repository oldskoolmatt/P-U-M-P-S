------------------
---- data.lua ----
------------------

-- Fetch functions from library
local add_tech = require ("utils.lib").add_tech

-- Offshore pump 1
add_tech ("offshore-pump-1", "fluid-handling")


-- Offshore pump 2
local offshore_technology_pump_2 =
{
	type = "technology",
	name = "offshore-pump-tech_2",
	icon_size = 128,
	icon = "__P-U-M-P-S__/graphics/technology/offshore-pump-2.png",
	prerequisites = {"fluid-handling"},
	effects ={{ type = "unlock-recipe", recipe = "offshore-pump-2" }},
	unit =
	{
		count = 50,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1}
		},
		time = 30
	},
	order = "d-a-a"
}

-- Offshore pump 3
local offshore_technology_pump_3 =
{
	type = "technology",
	name = "offshore-pump-tech_3",
	icon_size = 128,
	icon = "__P-U-M-P-S__/graphics/technology/offshore-pump-3.png",
	effects = {{ type = "unlock-recipe", recipe = "offshore-pump-3" }},
	prerequisites = {"offshore-pump-tech_2", "advanced-electronics"},
	unit =
	{
		count = 75,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1}
		},
		time = 30
	},
	order = "d-a-b"
}

-- Offshore pump 4
local offshore_technology_pump_4 =
{
	type = "technology",
	name = "offshore-pump-tech_4",
	icon_size = 128,
	icon = "__P-U-M-P-S__/graphics/technology/offshore-pump-4.png",
	effects = {{ type = "unlock-recipe", recipe = "offshore-pump-4" }},
	prerequisites = {"offshore-pump-tech_3", "advanced-electronics-2"},
	unit =
	{
		count = 100,
		ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
		time = 30
	},
	order = "d-a-b"
}

data:extend
({
	offshore_technology_pump_2,
	offshore_technology_pump_3,
	offshore_technology_pump_4
})