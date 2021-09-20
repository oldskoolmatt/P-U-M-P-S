game.reload_script()

local techs =
{
	["water-miner-1"] = "water-pumpjack-1",
	["water-miner-2"] = "water-miner_2",
	["water-miner-3"] = "water-miner_3",
	["water-miner-4"] = "water-miner_4",
	["water-miner-5"] = "water-miner_5"
}

for index, force in pairs(game.forces) do
	force.reset_recipes()
	force.reset_technologies()

	for old_tech, new_tech in pairs(techs) do
	
		if force.technologies[old_tech] and force.technologies[old_tech].researched then
			force.technologies[new_tech].researched = true --automatically unlock it
		end
	end
end