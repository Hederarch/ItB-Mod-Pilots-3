-- this line just gets the file path for your mod, so you can find all your files easily.
local path = mod_loader.mods[modApi.currentMod].resourcePath

-- read out other files and add what they return to variables.
local tooltips = require(path .."scripts/libs/tooltip")
local personalities = require(path .."scripts/libs/personality")
local dialog = require(path .."scripts/dialog")

-- trueIch made this functional, thanks trueIch!

local pilot = {
	Id = "Pilot_Dogfight_Hedera",					-- id must be unique. Used to link to art assets.
	Personality = "HexVeteran",	-- must match the id for a personality you have added to the game.
	Name = "Kaiser DuVal",
	Rarity = 1,
	Voice = "/voice/ralph",					-- audio. look in pilots.lua for more alternatives.
	Skill = "Flyby",
}

-- add pilot to the game.
CreatePilot(pilot)

-- add assets - notice how the name is identical to pilot.Id
modApi:appendAsset("img/portraits/pilots/Pilot_Dogfight_Hedera.png", path .."img/portraits/pilot.png")
modApi:appendAsset("img/portraits/pilots/Pilot_Dogfight_Hedera_2.png", path .."img/portraits/pilot_2.png")
modApi:appendAsset("img/portraits/pilots/Pilot_Dogfight_Hedera_blink.png", path .."img/portraits/pilot_blink.png")

-- add ability tooltip - notice how the name is the same as pilot.Skill
tooltips.Add("Flyby",
	PilotSkill("War Favors",
		"Each mission, gain a temporary unique weapon if the Mech has an empty slot."))

-- add personality.
local personality = personalities:new{ Label = "HexVeteran" }

-- add dialog to personality.
personality:AddDialog(dialog)

-- add personality to game - notice how the id is the same as pilot.Personality
Personality["HexVeteran"] = personality
