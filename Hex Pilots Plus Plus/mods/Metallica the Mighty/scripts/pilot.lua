-- this line just gets the file path for your mod, so you can find all your files easily.
local path = mod_loader.mods[modApi.currentMod].resourcePath

-- read out other files and add what they return to variables.
local tooltips = require(path .."scripts/libs/tooltip")
local personalities = require(path .."scripts/libs/personality")
local dialog = require(path .."scripts/dialog")

-- trueIch made this functional, thanks trueIch!

local pilot = {
	Id = "Pilot_Handshake_Hedera",					-- id must be unique. Used to link to art assets.
	Personality = "HexTerminator",	-- must match the id for a personality you have added to the game.
	Name = "Metallica",
	Rarity = 1,
	Voice = "/voice/ai",					-- audio. look in pilots.lua for more alternatives.
	Skill = "HexKickoff",
	PowerCost = 1,
}

-- add pilot to the game.
CreatePilot(pilot)

-- add assets - notice how the name is identical to pilot.Id
modApi:appendAsset("img/portraits/pilots/Pilot_Handshake_Hedera.png", path .."img/portraits/pilot.png")
modApi:appendAsset("img/portraits/pilots/Pilot_Handshake_Hedera_2.png", path .."img/portraits/pilot_2.png")
modApi:appendAsset("img/portraits/pilots/Pilot_Handshake_Hedera_blink.png", path .."img/portraits/pilot_blink.png")

-- add ability tooltip - notice how the name is the same as pilot.Skill
tooltips.Add("HexKickoff",
	PilotSkill("Power Couplers",
		"Mechs that start their turn adjacent gain Boost."))

-- add personality.
local personality = personalities:new{ Label = "HexTerminator" }

-- add dialog to personality.
personality:AddDialog(dialog)

-- add personality to game - notice how the id is the same as pilot.Personality
Personality["HexTerminator"] = personality
