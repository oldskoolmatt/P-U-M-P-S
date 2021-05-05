------------------------------------------------
---- here is where all functions are stored ----
------------------------------------------------

-- Setup function host
local functions = {}

-- Remove entity function
function functions.remove_entity(entity_name, entity_type, tech_name)
	if tech_name ~= nil and data.raw.technology[tech_name] then
		for i, effect in pairs(data.raw.technology[tech_name].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == entity_name then
				table.remove(data.raw.technology[tech_name].effects,i)
				data.raw.recipe[entity_name] = nil
				data.raw.item[entity_name] = nil
				data.raw[entity_type][entity_name] = nil
			end
		end
	else
		data.raw.recipe[entity_name] = nil
		data.raw.item[entity_name] = nil
		data.raw[entity_type][entity_name] = nil
	end
end


-- Hide entity
function functions.hide_entity(entity_name, tech_name)
	if data.raw.technology[tech_name] then
		for i, effect in pairs(data.raw.technology[tech_name].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == entity_name then
				table.remove(data.raw.technology[tech_name].effects,i)
				data.raw.recipe[entity_name].hidden = true
				data.raw.recipe[entity_name].enabled = false
				data.raw.item[entity_name].flags = {"hidden"}
				data.raw.item[entity_name].subgroup = "other"
			end
		end
	elseif data.raw.item[entity_name] then
		data.raw.recipe[entity_name].hidden = true
		data.raw.recipe[entity_name].enabled = false
		data.raw.item[entity_name].flags = {"hidden"}
		data.raw.item[entity_name].subgroup = "other"
	end
end

-- Fix collision mask
function functions.fix_collision_mask(entity_name)
	if data.raw["assembling-machine"][entity_name] then
		data.raw["assembling-machine"][entity_name].collision_mask = {"object-layer", "train-layer"}
		data.raw["offshore-pump"][entity_name .. "-placeholder"].collision_mask = {"object-layer", "train-layer"}
	else
		data.raw["offshore-pump"][entity_name].collision_mask = {"object-layer", "train-layer"}
	end
end

-- Add recipe to tech
function functions.add_tech_recipe(recipe, tech_name)
	if data.raw.technology[tech_name] and data.raw.recipe[recipe] then
		table.insert(data.raw.technology[tech_name].effects,{type = "unlock-recipe", recipe = recipe})
	end
end

-- Remove recipe from tech
function functions.remove_tech_recipe(recipe, tech_name)
	if data.raw.technology[tech_name] and data.raw.recipe[recipe] then
		for i, effect in pairs(data.raw.technology[tech_name].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == recipe then
				table.remove(data.raw.technology[tech_name].effects,i)
			end
		end
	end
end

-- Replace tech recipe
function functions.replace_tech_recipe(old_recipe, new_recipe, tech_name)
	if data.raw.technology[tech_name] and data.raw.recipe[old_recipe] and data.raw.recipe[new_recipe] then
		for i, effect in pairs(data.raw.technology[tech_name].effects) do
			if effect.type == "unlock-recipe" and effect.recipe == old_recipe then
				table.remove(data.raw.technology[tech_name].effects,i)
				table.insert(data.raw.technology[tech_name].effects,{type = "unlock-recipe", recipe = new_recipe})
			end
		end
	end
end

-- Replace tech ingredients
function functions.replace_tech_ingredient(old_ingredient, new_ingredient, tech_name)
	if data.raw.technology[tech_name].unit.ingredients then
		for i,ingredient in pairs(data.raw.technology[tech_name].unit.ingredients) do
			if ingredient.name == old_ingredient then
				table.remove(data.raw.technology[tech_name].unit.ingredients,i)
				table.insert(data.raw.technology[tech_name].unit.ingredients, {name=new_ingredient, amount=ingredient.amount})
			end
		end
	end
end

-- Set artisanal reskin tiering
function functions.assign_tier(filename, tier)
	inputs =
	{
		tier_labels = true,
		icon =
		{
			{
				icon = "__P-U-M-P-S__/graphics/icons/" .. filename .. ".png",
				icon_size = 64,
				icon_mipmaps = 4,
			}
		}
	}
	reskins.lib.append_tier_labels(tier, inputs)
	data.raw.item[filename].icons = inputs.icon
end

return functions