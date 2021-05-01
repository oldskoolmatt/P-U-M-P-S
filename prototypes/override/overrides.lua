------------------
---- data.lua ----
------------------

-- Fetch functions from library
local hide_entity = require("utils.lib").hide_entity
local fix_collision_mask = require ("utils.lib").fix_collision_mask
local add_tech = require ("utils.lib").add_tech
local rem_tech = require ("utils.lib").rem_tech
local replace_tech_recipe = require ("utils.lib").replace_tech_recipe
local remove_entity = require ("utils.lib").remove_entity
local sprite_recolor = require("utils.animation").sprite_recolor

-- Assign correct descriptions and names
if settings.startup ["enable-power"].value == true then
	
	data.raw.item["offshore-pump-0"].localised_name = {"entity-name.offshore-pump-0-burner"}
	data.raw["assembling-machine"]["offshore-pump-0"].localised_name = {"entity-name.offshore-pump-0-burner"}
	data.raw.item["offshore-pump-0"].localised_description = {"item-description.offshore-pump-0-burner"}
	
	data.raw.item["offshore-pump-1"].localised_name = {"entity-name.offshore-pump-1-electric"}
	data.raw["assembling-machine"]["offshore-pump-1"].localised_name = {"entity-name.offshore-pump-1-electric"}
	data.raw.item["offshore-pump-1"].localised_description = {"item-description.offshore-pump-1-electric"}
	
	data.raw.item["offshore-pump-2"].localised_name = {"entity-name.offshore-pump-2-electric"}
	data.raw["assembling-machine"]["offshore-pump-2"].localised_name = {"entity-name.offshore-pump-2-electric"}
	data.raw.item["offshore-pump-2"].localised_description = {"item-description.offshore-pump-2-electric"}
	
	data.raw.item["offshore-pump-3"].localised_name = {"entity-name.offshore-pump-3-electric"}
	data.raw["assembling-machine"]["offshore-pump-3"].localised_name = {"entity-name.offshore-pump-3-electric"}
	data.raw.item["offshore-pump-3"].localised_description = {"item-description.offshore-pump-3-electric"}
	
	data.raw.item["offshore-pump-4"].localised_name = {"entity-name.offshore-pump-4-electric"}
	data.raw["assembling-machine"]["offshore-pump-4"].localised_name = {"entity-name.offshore-pump-4-electric"}
	data.raw.item["offshore-pump-4"].localised_description = {"item-description.offshore-pump-4-electric"}
else
	data.raw.item["offshore-pump-0"].localised_description = {"item-description.offshore-pump-0"}
	data.raw.item["offshore-pump-1"].localised_description = {"item-description.offshore-pump-1"}
	data.raw.item["offshore-pump-2"].localised_description = {"item-description.offshore-pump-2"}
	data.raw.item["offshore-pump-3"].localised_description = {"item-description.offshore-pump-3"}
	data.raw.item["offshore-pump-4"].localised_description = {"item-description.offshore-pump-4"}
end

-- Remove template entities
remove_entity("unpowered-offshore-template", "offshore-pump")
remove_entity("burner-offshore-template", "assembling-machine")
remove_entity("electric-offshore-template", "assembling-machine")

-- Apply color masks
sprite_recolor()

-- Edit recipes for bobs
if mods ["bobplates"] then		
	if mods ["boblogistics"] then
		data.raw.recipe["offshore-pump-2"].ingredients =
		{
			{type="item", name="advanced-circuit", amount=2},
			{type="item", name="steel-pipe", amount=1},
			{type="item", name="steel-gear-wheel", amount=5}
		}
		data.raw.recipe["offshore-pump-3"].ingredients =
		{
			{type="item", name="processing-unit", amount=2},
			{type="item", name="titanium-pipe", amount=1},
			{type="item", name="titanium-gear-wheel", amount=5}
		}
		data.raw.recipe["offshore-pump-4"].ingredients =
		{
			{type="item", name="advanced-processing-unit", amount=2},
			{type="item", name="nitinol-pipe", amount=1},
			{type="item", name="nitinol-gear-wheel", amount=5}
		}
		data.raw.technology["offshore-pump-tech_2"].prerequisites = {"bob-fluid-handling-2", "advanced-electronics"}
		data.raw.technology["offshore-pump-tech_3"].prerequisites = {"offshore-pump-tech_2", "bob-fluid-handling-3", "advanced-electronics-2"}
		data.raw.technology["offshore-pump-tech_4"].prerequisites = {"offshore-pump-tech_3", "bob-fluid-handling-4", "advanced-electronics-3"}
	else
		data.raw.recipe["offshore-pump-1"].ingredients =
		{
			{type="item", name="copper-plate", amount=2},
			{type="item", name="iron-plate", amount=1},
			{type="item", name="iron-gear-wheel", amount=5}
		}
		data.raw.recipe["offshore-pump-2"].ingredients =
		{
			{type="item", name="advanced-circuit", amount=2},
			{type="item", name="steel-plate", amount=1},
			{type="item", name="steel-gear-wheel", amount=5}
		}
		data.raw.recipe["offshore-pump-3"].ingredients =
		{
			{type="item", name="processing-unit", amount=2},
			{type="item", name="titanium-plate", amount=1},
			{type="item", name="titanium-gear-wheel", amount=5}
		}
		data.raw.recipe["offshore-pump-4"].ingredients =
		{
			{type="item", name="advanced-processing-unit", amount=2},
			{type="item", name="nitinol-alloy", amount=1},
			{type="item", name="nitinol-gear-wheel", amount=5}
		}
		data.raw.technology["offshore-pump-tech_2"].prerequisites = {"fluid-handling", "advanced-electronics"}
		data.raw.technology["offshore-pump-tech_3"].prerequisites = {"offshore-pump-tech_2", "titanium-processing", "advanced-electronics-2"}
		data.raw.technology["offshore-pump-tech_4"].prerequisites = {"offshore-pump-tech_3", "nitinol-processing", "advanced-electronics-3"}
	end
else
	if mods ["boblogistics"] then
		data.raw.technology["offshore-pump-tech_2"].prerequisites = {"bob-fluid-handling-2", "advanced-electronics"}
		data.raw.technology["offshore-pump-tech_3"].prerequisites = {"offshore-pump-tech_2", "bob-fluid-handling-3", "advanced-electronics-2"}
		data.raw.technology["offshore-pump-tech_4"].prerequisites = {"offshore-pump-tech_3", "bob-fluid-handling-4", "advanced-electronics-2"}
	end
end