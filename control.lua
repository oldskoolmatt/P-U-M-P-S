-- Set placeholder table
local placeholder_table =
{
	["offshore-pump-0-placeholder"] = "offshore-pump-0",
	["offshore-pump-1-placeholder"] = "offshore-pump-1",
	["offshore-pump-2-placeholder"] = "offshore-pump-2",
	["offshore-pump-3-placeholder"] = "offshore-pump-3",
	["offshore-pump-4-placeholder"] = "offshore-pump-4"
}

-- Entity control function 
function on_built_entity(event)

	-- Boilers start with 10 water
	if settings.global["boiler-start-water"].value == true then
		if event.created_entity.type == "boiler" then
			event.created_entity.insert_fluid({name = "water", amount = 10})
		end
	end
	-- Replace placeholder with actual entity
	if event.created_entity.type == "offshore-pump" then
		local placeholder = event.created_entity or event.entity
		local placeholder_name = placeholder.name
		local surface = placeholder.surface
		local position = placeholder.position
		local direction = placeholder.direction
		local force = placeholder.force
		local name = placeholder_table[placeholder_name]
		if not name then return else end

		placeholder.destroy()
		surface.create_entity
		{
			name = name,
			position = position,
			direction = direction,
			force = force,
			fast_replace = true,
			spill = false,
			raise_built = true,
			create_build_effect_smoke = false
		}
	end
end

script.on_event(defines.events.on_built_entity, on_built_entity)
script.on_event(defines.events.on_robot_built_entity, on_built_entity)

-- Set rebuild list
local rebuild_list =
{
	"offshore-pump-0",
	"offshore-pump-1",
	"offshore-pump-2",
	"offshore-pump-3",
	"offshore-pump-4"
}

-- Rebuild offshore pumps on load to prevent pipe detachment on settings change
script.on_configuration_changed(function(data)
	for _, surface in pairs (game.surfaces, rebuild_list) do
		local offshore_pumps = surface.find_entities_filtered{name = rebuild_list}
		for _, old_pump in pairs (offshore_pumps) do

			local name = old_pump.name
			local position = old_pump.position
			local direction = old_pump.direction
			local force = old_pump.force
			if not name then return else end

			old_pump.destroy()
			surface.create_entity
			{
				name = name,
				position = position,
				direction = direction,
				force = force,
				fast_replace = true,
				spill = false,
				raise_built = true,
				create_build_effect_smoke = false
			}
		end
	end
end)