
-- init.lua is the entry point of every mod

local mod = {
	id = "Pilot_Barrier_Hedera",
	name = "Onyx the Guardian",
	version = "1.0.0",
	requirements = {},
	modApiVersion = "2.3.0",
	icon = "img/mod_icon.png"
}

function mod:init()
	-- look in template/pilot to see how to code pilots.
	require(self.scriptPath .."pawns")
	local pilot = require(self.scriptPath .."pilot")
	pilot:init(mod)
	require(self.scriptPath .."personality")
	local replaceRepair = require(self.scriptPath.."replaceRepair/replaceRepair")
end

function mod:load(options, version)
end

return mod
