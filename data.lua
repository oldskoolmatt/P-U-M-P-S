------------------
---- data.lua ----
------------------

-- Local functions host
local OSM_local = require("utils.lib")
local OSM_anim = require("utils.animation")

-- Load prototypes
require("prototypes.core")
require("prototypes.entities")
require("prototypes.recipes")
require("prototypes.items")
require("prototypes.technology")
require("prototypes.override.bob-water-miner")

-- Change entity in tips and tricks [prevents crashes]
for _, trigger in pairs(data.raw["tips-and-tricks-item"]["electric-network"].trigger.triggers) do
	if trigger.entity == "offshore-pump" then trigger.entity = "offshore-pump-0" end
end

-- Assign correct descriptions and names
if settings.startup ["enable-power"].value == true then

	local offshore_pumps =
	{
		"offshore-pump-0",
		"offshore-pump-1",
		"offshore-pump-2",
		"offshore-pump-3",
		"offshore-pump-4"
	}
	
	for _, pump_name in pairs (offshore_pumps) do
		data.raw.item[pump_name].localised_name = {"entity-name."..pump_name.."-pwr"}
		data.raw["assembling-machine"][pump_name].localised_name = {"entity-name."..pump_name.."-pwr"}
		data.raw.item[pump_name].localised_description = {"item-description."..pump_name.."-pwr"}
	end

else
	for _, pump_name in pairs (offshore_pumps) do
		data.raw.item[pump_name].localised_description = {"item-description."..pump_name}
	end
end

-- Recolor offshore pumps
OSM_anim.assign_offshore_color()