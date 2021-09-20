--------------------------
---- data-updates.lua ----
--------------------------

-- Local functions host
local OSM_local = require("utils.lib")
local OSM_anim = require("utils.animation")

-- Apply overrides
require("prototypes.override.bob-water-miner-updates")
require("prototypes.override.bob-overrides")
require("prototypes.override.angel-overrides")

-- Ground water pumpjacks
if (mods["reskins-bobs"] and (reskins.bobs and reskins.bobs.triggers.mining.entities)) then

	-- Reskin entities
	OSM_local.pumpjack_entity_tiering()

	-- Reskin icons
	OSM_local.pumpjack_icon_tiering()
end