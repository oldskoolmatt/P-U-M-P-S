------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Local functions host
local OSM_local = require("utils.lib")
local OSM_anim = require("utils.animation")

-- Prevent collision mask mismatch
OSM_local.fix_collision_mask()

if settings.startup ["enable-power"].value == true then
	data.raw["assembling-machine"]["offshore-pump-1"].next_upgrade = "offshore-pump-2-placeholder"
	data.raw["assembling-machine"]["offshore-pump-2"].next_upgrade = "offshore-pump-3-placeholder"
	data.raw["assembling-machine"]["offshore-pump-3"].next_upgrade = "offshore-pump-4-placeholder"
else
	data.raw["offshore-pump"]["offshore-pump-1"].next_upgrade = "offshore-pump-2"
	data.raw["offshore-pump"]["offshore-pump-2"].next_upgrade = "offshore-pump-3"
	data.raw["offshore-pump"]["offshore-pump-3"].next_upgrade = "offshore-pump-4"
end


-- Load the: SUPER-DUPER-PROTO-NUKER (BEGONE PESKY DUPLICATES!!!)

-- Get mod name
local OSM_mod = OSM.mod.PUMPS

-- List of entities to be nuked
local nuke_list = {["offshore-pump"] = "offshore-pump-1",}

-- OH NO!!! YOU PRESSED THE RED BUTTON!!!
OSM.lib.prototype.super_duper_proto_nuker(nuke_list, OSM_mod)
---------------------------------------------------------------
-- Just because: https://www.youtube.com/watch?v=X0fp-kq-0Fw --
---------------------------------------------------------------