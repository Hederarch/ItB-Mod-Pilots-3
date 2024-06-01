--Mod
local mod = mod_loader.mods[modApi.currentMod]

--Paths
local scriptPath = mod.scriptPath
local resourcePath = mod.resourcePath
--------------------------------------------------- UTILITY / LOCAL FUNCTIONS ---------------------------------------------------
ANIMS.Evac_TimeTravel = Animation:new{
	Image = "effects/timetravel.png",
	NumFrames = 19,
	Loop = false,
	PosX = -32,
	Time = 0.05,
	PosY = -145,
}
----------------------------------------------- HOOKS HANDLERS -----------------------------------------------

local function IsUserPresent()
	--LOG("Running Pilot Check")
	for i = 0, 2 do
		local mech = Board:GetPawn(i)
		--LOG("i: " .. tostring(i))
		if mech then
			--LOG("ability: " .. mech:GetAbility()) 
			if mech:IsAbility("HexKickoff") then
				--LOG("mech has right skill!")
				return true
			else
				--LOG("not the right skill :(")
			end
		else
			--LOG("Mech doesn't exist!!")
		end
	end
	return false
end

local function GetUser()
	for i = 0,2 do
		local mech = Board:GetPawn(i)
		if mech then
			--LOG("ability: " .. mech:GetAbility()) 
			if mech:IsAbility("HexKickoff") then
				--LOG("mech has the right skill!")
				return Board:GetPawn(i)
			end
		end
	end
	return nil
end


local function DoEffect()
	for i = 0,2 do
		local mech = Board:GetPawn(i)
		if mech then
			for dir = DIR_START,DIR_END do
				local target = mech:GetSpace()+DIR_VECTORS[dir]
				if Board:IsPawnSpace(target) and Board:GetPawn(target):IsMech() then
					Board:GetPawn(target):SetBoosted(true)
					Board:AddAnimation(mech:GetSpace(), "MetallicaBoost_"..dir,ANIM_DELAY) 
				end
			end
		end
	end
end


local evac = function(mission)
	if IsUserPresent() and Game:GetTeamTurn() == TEAM_PLAYER then
			DoEffect()
	end
end

----------------------------------------------- HOOKS / EVENTS SUBSCRIPTION -----------------------------------------------

local function EVENT_onModsLoaded()
	modApi:addNextTurnHook(evac)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)