------------------
---- data.lua ----
------------------

-- Edit recipes and techs for bobs
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

if mods ["bobtech"] then
	table.insert(data.raw.technology["offshore-pump-tech_4"].unit.ingredients, {"advanced-logistic-science-pack", 1})
else
	table.insert(data.raw.technology["offshore-pump-tech_4"].unit.ingredients, {"production-science-pack", 1})
end

