--Mod
local mod = mod_loader.mods[modApi.currentMod]

--Paths
local scriptPath = mod.scriptPath
local resourcePath = mod.resourcePath
--------------------------------------------------- UTILITY / LOCAL FUNCTIONS ---------------------------------------------------
local function clearMissionData(mission)
	mission.PawnsBuffed = {0}
	end
----------------------------------------------- HOOKS HANDLERS -----------------------------------------------

local function IsUserPresent()
	--LOG("Running Pilot Check")
	for i = 0, 2 do
		local mech = Board:GetPawn(i)
		--LOG("i: " .. tostring(i))
		if mech then
			--LOG("ability: " .. mech:GetAbility()) 
			if mech:IsAbility("DeployBoostSkill") then
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
			if mech:IsAbility("DeployBoostSkill") then
				--LOG("mech has the right skill!")
				return Board:GetPawn(i)
			end
		end
	end
	return nil
end




local miniboost = function(pawn)
	local mission = GetCurrentMission()
	if IsUserPresent() and pawn:GetTeam() == TEAM_PLAYER and not pawn:IsMech() then
			pawn:SetBoosted(true)
			if mission ~= nil and mission.PawnsBuffed[pawn:GetId()] == nil then
				mission.PawnsBuffed[pawn:GetId()] = true
				pawn:SetShield(true)
			end
	end
end

local miniboost_hook = function(mission,pawn)
	miniboost(pawn)
end

local miniboost_iterate = function(mission,pawn)
	for _, id in ipairs(extract_table(Board:GetPawns(TEAM_PLAYER))) do
	  miniboost(Board:GetPawn(id))
    end
end

----------------------------------------------- HOOKS / EVENTS SUBSCRIPTION -----------------------------------------------

local function EVENT_onModsLoaded()
	modapiext:addPawnTrackedHook(miniboost_hook)
	modApi:addNextTurnHook(miniboost_iterate)
	modApi:addMissionStartHook(function(mission)
		clearMissionData(mission)
	end)
	modApi:addMissionNextPhaseCreatedHook(function(_, mission)
		clearMissionData(mission)
	end)
end


modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)