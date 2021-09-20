
if not mods ["bobmining"] then return end

------------------------------------------------------------------------------------------------------
-------------------------------- SHAMELESSLY STOLEN FROM BOB'S MINING --------------------------------
------------------------------------------------------------------------------------------------------

-- SORRY BOB :(

if settings.startup["bobmods-mining-waterminers"].value == true then

data:extend(
{
  {
    type = "technology",
    name = "water-miner_2",
	icon = "__P-U-M-P-S__/graphics/technology/water-pumpjack.png",
	icon_size = 256,
	icon_mipmaps = 4,	
    order = "d-a-d-2",
    prerequisites =
    {
      "water-pumpjack",
      "steel-processing",
      "electronics"
    },
    unit =
    {
      count = 30,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "water-pumpjack-2"
      },
    },
  },
  {
    type = "technology",
    name = "water-miner_3",
	icon = "__P-U-M-P-S__/graphics/technology/water-pumpjack.png",
    icon_size = 256,
	icon_mipmaps = 4,
	order = "d-a-d-3",
    prerequisites =
    {
      "water-miner_2",
      "advanced-electronics"
    },
    unit =
    {
      count = 50,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "water-pumpjack-3"
      },
    },
  },
  {
    type = "technology",
    name = "water-miner_4",
	icon = "__P-U-M-P-S__/graphics/technology/water-pumpjack.png",
    icon_size = 256,
	icon_mipmaps = 4,
	order = "d-a-d-4",
    prerequisites =
    {
      "water-miner_3",
      "advanced-electronics-2"
    },
    unit =
    {
      count = 75,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "water-pumpjack-4"
      },
    },
  },
  {
    type = "technology",
    name = "water-miner_5",
	icon = "__P-U-M-P-S__/graphics/technology/water-pumpjack.png",
    icon_size = 256,
	icon_mipmaps = 4,
	order = "d-a-d-5",
    prerequisites =
    {
      "water-miner_4",
    },
    unit =
    {
      count = 100,
      time = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "water-pumpjack-5"
      },
    },
  },
}
)

end