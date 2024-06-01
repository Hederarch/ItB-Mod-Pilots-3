
-- init.lua is the entry point of every mod

local mod = {
	id = "hedera_dangerismymiddlename_pilot",
	name = "Darwin the Renegade",
	version = "1.0.0",
	dependencies = {
		modApiExt = "1.22",
	},
	modApiVersion = "2.3.0",
	icon = "img/mod_icon.png"
}

function mod:init()
	
	-- look in template/pilot to see how to code pilots.
	require(self.scriptPath .."pilot")
	
	--truelch test
	require(self.scriptPath .. "hooks")
end

function mod:load(options, version)
end

return mod
