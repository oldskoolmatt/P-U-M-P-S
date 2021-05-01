------------------
---- data.lua ----
------------------

-- Fetch external properties
local graphics_set = require("utils.animation").template_unpowered_animation() -- unpowered pump uses graphics_set
local animation = require("utils.animation").template_powered_animation() -- powered pump uses animation
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local electric_priority
if settings.startup ["power-priority"].value == true then
	electric_priority = "primary-input"
else
	electric_priority = "secondary-input"
end

-- Set common properties
local collision_mask = {"object-layer", "train-layer"}
local center_collision_mask = {"water-tile", "object-layer", "player-layer"}
local collision_box = {{-0.6, -1.05}, {0.6, 0.3}}
local selection_box = {{-0.6, -1.49}, {0.6, 0.49}}
local adjacent_tile_collision_box = {{-1, -2}, {1, -1}}
local tile_width = 1
local tile_height = 1
local fast_replaceable_group = "electric-offshore-pumps"
local icon_size = 64
local icon_mipmaps = 4
local flags = {"placeable-neutral", "player-creation", "filter-directions"}
local corpse = "offshore-pump-remnants"
local dying_explosion = "offshore-pump-explosion"
local alert_icon_shift = util.by_pixel(0, 0)
local resistances = {{type = "fire", percent = 70}}
local subgroup = "other"
local damaged_trigger_effect = hit_effects.entity()
local circuit_wire_connection_points = circuit_connector_definitions["offshore-pump"].points
local circuit_connector_sprites = circuit_connector_definitions["offshore-pump"].sprites
local circuit_wire_max_distance = default_circuit_wire_max_distance
local squeak_behaviour = false
local open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85}
local close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75}
local vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65}
local working_sound =
{
	sound =
	{
		{
			filename = "__base__/sound/offshore-pump.ogg",
			volume = 0.45
		}
	},
	match_volume_to_activity = true,
	audible_distance_modifier = 0.5,
	max_sounds_per_type = 3,
	fade_in_ticks = 4,
	fade_out_ticks = 20
}
local water_reflection =
{
	pictures =
	{
		filename = "__base__/graphics/entity/offshore-pump/offshore-pump-reflection.png",
		priority = "extra-high",
		width = 132,
		height = 156,
		shift = util.by_pixel(0, 19),
		variation_count = 4,
		scale = 1
	},
	rotate = false,
	orientation_to_variation = true
}
local fluid_box = -- unpowered pump uses fluid_box
{
	base_area = 1,
	base_level = 1,
	pipe_covers = pipecoverspictures(),
	production_type = "output",
	filter = "water",
	pipe_connections =
	{
		{
			position = {0, 1},
			type = "output"
		}
	}
}
local fluid_boxes = -- powered pump uses fluid_boxes
{
	fluid_box,
	off_when_no_fluid_recipe = false
}
local placeable_position_visualization =
{
	filename = "__core__/graphics/cursor-boxes-32x32.png",
	priority = "extra-high-no-scale",
	width = 64,
	height = 64,
	scale = 0.5,
	x = 3*64
}

-- Make template for unpowered offshore pump
local unpowered_pump_template =
{
	-- Template base properties
	type = "offshore-pump",
	name = "unpowered-offshore-template",
	icon = "__base__/graphics/icons/offshore-pump.png",
	max_health = 1, -- base 150
	pumping_speed = 1, -- base 20 (1200/s)
	order = "8==D", -- yeah, it's a dick bitch!
	
	-- Template unique properties
	fluid = "water",
	always_draw_fluid = true,
	min_perceived_performance = 0.5,
	fluid_box_tile_collision_test = {"ground-tile"},
	adjacent_tile_collision_test = {"water-tile" },
	adjacent_tile_collision_mask = { "ground-tile"},
	graphics_set = graphics_set,
	
	-- Template common properties
    collision_mask = collision_mask,
	center_collision_mask = center_collision_mask,
	collision_box = collision_box,
	selection_box = selection_box,
	adjacent_tile_collision_box = adjacent_tile_collision_box,
	tile_width = tile_width,
	tile_height = tile_height,
	fast_replaceable_group = fast_replaceable_group,
	icon_size = icon_size,
	icon_mipmaps = icon_mipmaps,
	flags = flags,
    corpse = corpse,
    dying_explosion = dying_explosion,
	alert_icon_shift = alert_icon_shift,
	resistances = resistances,
	subgroup = subgroup,
	damaged_trigger_effect = damaged_trigger_effect,
	circuit_wire_connection_points = circuit_wire_connection_points,
	circuit_connector_sprites = circuit_connector_sprites,
	circuit_wire_max_distance = circuit_wire_max_distance,
	squeak_behaviour = squeak_behaviour,
	open_sound = open_sound,
	close_sound = close_sound,
	vehicle_impact_sound =  vehicle_impact_sound,
	working_sound = working_sound,
	water_reflection = water_reflection,
	placeable_position_visualization = placeable_position_visualization,
	fluid_box = fluid_box
}	data:extend({unpowered_pump_template})

-- Make template for burner offshore pump
local burner_pump_template =
{
	-- Template base properties
	type = "assembling-machine",
	name = "burner-offshore-template",
	icon = "__base__/graphics/icons/offshore-pump.png",
	max_health = 1, -- base 150
	crafting_speed = 1, -- base 4 (1200/s)
	energy_usage = "1kW", -- base 1200kW
	order = "8==D", -- yeah, it's a dick bitch!

	-- Template unique properties
	crafting_categories = {"pump-water"},
    fixed_recipe = "pump-water",
	energy_source = {type = "burner", fuel_category = "chemical", effectivity = 1, fuel_inventory_size = 1, emissions_per_minute = 3},
	trigger_created_entity = true,
	allowed_effects = {"consumption", "pollution"},
	animation = animation,

	-- Template common properties
    collision_mask = collision_mask,
	center_collision_mask = center_collision_mask,
	collision_box = collision_box,
	selection_box = selection_box,
	adjacent_tile_collision_box = adjacent_tile_collision_box,
	tile_width = tile_width,
	tile_height = tile_height,
	fast_replaceable_group = fast_replaceable_group,
	icon_size = icon_size,
	icon_mipmaps = icon_mipmaps,
	flags = flags,
    corpse = corpse,
    dying_explosion = dying_explosion,
	alert_icon_shift = alert_icon_shift,
	resistances = resistances,
	subgroup = subgroup,
	damaged_trigger_effect = damaged_trigger_effect,
	circuit_wire_connection_points = circuit_wire_connection_points,
	circuit_connector_sprites = circuit_connector_sprites,
	circuit_wire_max_distance = circuit_wire_max_distance,
	squeak_behaviour = squeak_behaviour,
	open_sound = open_sound,
	close_sound = close_sound,
	vehicle_impact_sound =  vehicle_impact_sound,
	working_sound = working_sound,
	water_reflection = water_reflection,
	placeable_position_visualization = placeable_position_visualization,
	fluid_boxes = fluid_boxes
}	data:extend({burner_pump_template})

-- Make template for electric offshore pump
local powered_pump_template =
{
	-- Template base properties
	type = "assembling-machine",
	name = "electric-offshore-template",
	icon = "__base__/graphics/icons/offshore-pump.png",
	max_health = 1, -- base 150
	crafting_speed = 1, -- base 4 (1200/s)
	energy_usage = "1kW", -- base 1200kW
	order = "8==D", -- yeah, it's a dick bitch!

	-- Template unique properties
	crafting_categories = {"pump-water"},
    fixed_recipe = "pump-water",
	energy_source = {type = "electric", usage_priority = electric_priority},
	trigger_created_entity = true,
	allowed_effects = {"consumption"},
	animation = animation,

	-- Template common properties
    collision_mask = collision_mask,
	center_collision_mask = center_collision_mask,
	collision_box = collision_box,
	selection_box = selection_box,
	adjacent_tile_collision_box = adjacent_tile_collision_box,
	tile_width = tile_width,
	tile_height = tile_height,
	fast_replaceable_group = fast_replaceable_group,
	icon_size = icon_size,
	icon_mipmaps = icon_mipmaps,
	flags = flags,
    corpse = corpse,
    dying_explosion = dying_explosion,
	alert_icon_shift = alert_icon_shift,
	resistances = resistances,
	subgroup = subgroup,
	damaged_trigger_effect = damaged_trigger_effect,
	circuit_wire_connection_points = circuit_wire_connection_points,
	circuit_connector_sprites = circuit_connector_sprites,
	circuit_wire_max_distance = circuit_wire_max_distance,
	squeak_behaviour = squeak_behaviour,
	open_sound = open_sound,
	close_sound = close_sound,
	vehicle_impact_sound =  vehicle_impact_sound,
	working_sound = working_sound,
	water_reflection = water_reflection,
	placeable_position_visualization = placeable_position_visualization,
	fluid_boxes = fluid_boxes
}	data:extend({powered_pump_template})

-- Make offshore pumps based on power settings
if settings.startup ["enable-power"].value == true then

	-- Make offshore pump 0
	local offshore_placeholder_0 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"]) -- Placeholder burner
	offshore_placeholder_0.subgroup = "extraction-machine"
	offshore_placeholder_0.name = "offshore-pump-0-placeholder"
	offshore_placeholder_0.minable = {mining_time = 0.1, result = "offshore-pump-0"}
	offshore_placeholder_0.max_health = 100
	offshore_placeholder_0.pumping_speed = 5
	data:extend({offshore_placeholder_0})
	
	local offshore_pump_0 = table.deepcopy(data.raw["assembling-machine"]["burner-offshore-template"]) -- Offshore pump burner
	offshore_pump_0.name = "offshore-pump-0"
	offshore_pump_0.icon = "__base__/graphics/icons/offshore-pump.png"
	offshore_pump_0.minable = {mining_time = 0.1, result = "offshore-pump-0"}
	offshore_pump_0.placeable_by = {item = "offshore-pump-0", count = 1}
	offshore_pump_0.max_health = 100
	offshore_pump_0.crafting_speed = 1
	offshore_pump_0.energy_usage = "600kW"
	data:extend({offshore_pump_0})

	-- Make offshore pump 1
	local offshore_placeholder_1 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"]) -- Placeholder 1
	offshore_placeholder_1.subgroup = "extraction-machine"
	offshore_placeholder_1.name = "offshore-pump-1-placeholder"
	offshore_placeholder_1.minable = {mining_time = 0.1, result = "offshore-pump-1"}
	offshore_placeholder_1.max_health = 150
	offshore_placeholder_1.pumping_speed = 20
	data:extend({offshore_placeholder_1})
	
	local offshore_pump_1 = table.deepcopy(data.raw["assembling-machine"]["electric-offshore-template"]) -- Offshore pump 1
	offshore_pump_1.next_upgrade = "offshore-pump-2-placeholder"
	offshore_pump_1.name = "offshore-pump-1"
	offshore_pump_1.icon = "__base__/graphics/icons/offshore-pump.png"
	offshore_pump_1.minable = {mining_time = 0.1, result = "offshore-pump-1"}
	offshore_pump_1.placeable_by = {item = "offshore-pump-1", count = 1}
	offshore_pump_1.max_health = 150
	offshore_pump_1.crafting_speed = 4
	offshore_pump_1.energy_usage = "1200kW"
	data:extend({offshore_pump_1})
	
	-- Make offshore pump 2
	local offshore_placeholder_2 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"]) -- Placeholder 2
	offshore_placeholder_2.subgroup = "extraction-machine"
	offshore_placeholder_2.name = "offshore-pump-2-placeholder"
	offshore_placeholder_2.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-2.png"
	offshore_placeholder_2.minable = {mining_time = 0.1, result = "offshore-pump-2"}
	offshore_placeholder_2.max_health = 200
	offshore_placeholder_2.pumping_speed = 40
	data:extend({offshore_placeholder_2})
	
	local offshore_pump_2 = table.deepcopy(data.raw["assembling-machine"]["electric-offshore-template"]) -- Offshore pump 2
	offshore_pump_2.next_upgrade = "offshore-pump-3-placeholder"
	offshore_pump_2.name = "offshore-pump-2"
	offshore_pump_2.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-2.png"
	offshore_pump_2.minable = {mining_time = 0.1, result = "offshore-pump-2"}
	offshore_pump_2.placeable_by = {item = "offshore-pump-2", count = 1}
	offshore_pump_2.max_health = 200
	offshore_pump_2.crafting_speed = 8
	offshore_pump_2.energy_usage = "2000kW"
	data:extend({offshore_pump_2})
	
	-- Make offshore pump 3
	local offshore_placeholder_3 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"]) -- Placeholder 3
	offshore_placeholder_3.subgroup = "extraction-machine"
	offshore_placeholder_3.name = "offshore-pump-3-placeholder"
	offshore_placeholder_3.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-3.png"
	offshore_placeholder_3.minable = {mining_time = 0.1, result = "offshore-pump-3"}
	offshore_placeholder_3.max_health = 250
	offshore_placeholder_3.pumping_speed = 60
	data:extend({offshore_placeholder_3})
	
	local offshore_pump_3 = table.deepcopy(data.raw["assembling-machine"]["electric-offshore-template"]) -- Offshore pump 3
	offshore_pump_3.next_upgrade = "offshore-pump-4-placeholder"
	offshore_pump_3.name = "offshore-pump-3"
	offshore_pump_3.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-3.png"
	offshore_pump_3.minable = {mining_time = 0.1, result = "offshore-pump-3"}
	offshore_pump_3.placeable_by = {item = "offshore-pump-3", count = 1}
	offshore_pump_3.max_health = 250
	offshore_pump_3.crafting_speed = 12
	offshore_pump_3.energy_usage = "2800kW"
	data:extend({offshore_pump_3})
	
	-- Make offshore pump 4
	local offshore_placeholder_4 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"]) -- Placeholder 4
	offshore_placeholder_4.subgroup = "extraction-machine"
	offshore_placeholder_4.name = "offshore-pump-4-placeholder"
	offshore_placeholder_4.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-4.png"
	offshore_placeholder_4.minable = {mining_time = 0.1, result = "offshore-pump-4"}
	offshore_placeholder_4.max_health = 300
	offshore_placeholder_4.pumping_speed = 80
	data:extend({offshore_placeholder_4})

	local offshore_pump_4 = table.deepcopy(data.raw["assembling-machine"]["electric-offshore-template"]) -- Offshore pump 4
	offshore_pump_4.name = "offshore-pump-4"
	offshore_pump_4.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-4.png"
	offshore_pump_4.minable = {mining_time = 0.1, result = "offshore-pump-4"}
	offshore_pump_4.placeable_by = {item = "offshore-pump-4", count = 1}
	offshore_pump_4.max_health = 300
	offshore_pump_4.crafting_speed = 16
	offshore_pump_4.energy_usage = "3600kW"
	data:extend({offshore_pump_4})

else --error("\nDISABLING POWER REQUIREMENTS FOR OFFSHORE PUMPS BREAKS THE FIRST LAW OF THERMODYNAMICS!!!\nPLEASE RESET MOD SETTINGS!")

	-- Make absolutely-fine-perpetual-motion water-thing 0
	local offshore_pump_0 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"])
	offshore_pump_0.subgroup = "extraction-machine"
	offshore_pump_0.name = "offshore-pump-0"
	offshore_pump_0.minable = {mining_time = 0.1, result = "offshore-pump-0"}
	offshore_pump_0.max_health = 100
	offshore_pump_0.pumping_speed = 5
	data:extend({offshore_pump_0})

	-- Make absolutely-fine-perpetual-motion water-thing 1
	local offshore_pump_1 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"])
	offshore_pump_1.next_upgrade = "offshore-pump-2"
	offshore_pump_1.subgroup = "extraction-machine"
	offshore_pump_1.name = "offshore-pump-1"
	offshore_pump_1.minable = {mining_time = 0.1, result = "offshore-pump-1"}
	offshore_pump_1.placeable_by = {item = "offshore-pump-1", count = 1}
	offshore_pump_1.pumping_speed = 20
	offshore_pump_1.max_health = 150
	data:extend({offshore_pump_1})

	-- Make absolutely-fine-perpetual-motion water-thing 2
	local offshore_pump_2 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"])
	offshore_pump_2.next_upgrade = "offshore-pump-3"
	offshore_pump_2.subgroup = "extraction-machine"
	offshore_pump_2.name = "offshore-pump-2"
	offshore_pump_2.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-2.png"
	offshore_pump_2.minable = {mining_time = 0.1, result = "offshore-pump-2"}
	offshore_pump_2.placeable_by = {item = "offshore-pump-2", count = 1}
	offshore_pump_2.pumping_speed = 40
	offshore_pump_2.max_health = 200
	data:extend({offshore_pump_2})

	-- Make absolutely-fine-perpetual-motion water-thing 3
	local offshore_pump_3 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"])
	offshore_pump_3.next_upgrade = "offshore-pump-4"
	offshore_pump_3.subgroup = "extraction-machine"
	offshore_pump_3.name = "offshore-pump-3"
	offshore_pump_3.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-3.png"
	offshore_pump_3.minable = {mining_time = 0.1, result = "offshore-pump-3"}
	offshore_pump_3.placeable_by = {item = "offshore-pump-3", count = 1}
	offshore_pump_3.pumping_speed = 60
	offshore_pump_3.max_health = 250
	data:extend({offshore_pump_3})
	
	-- Make absolutely-fine-perpetual-motion water-thing 4
	local offshore_pump_4 = table.deepcopy(data.raw["offshore-pump"]["unpowered-offshore-template"])
	offshore_pump_4.name = "offshore-pump-4"
	offshore_pump_4.subgroup = "extraction-machine"
	offshore_pump_4.icon = "__P-U-M-P-S__/graphics/icons/offshore-pump-4.png"
	offshore_pump_4.minable = {mining_time = 0.1, result = "offshore-pump-4"}
	offshore_pump_4.placeable_by = {item = "offshore-pump-4", count = 1}
	offshore_pump_4.pumping_speed = 80
	offshore_pump_4.max_health = 300
	data:extend({offshore_pump_4})
end