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
			if mech:IsAbility("DangerFlares") then
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
			if mech:IsAbility("DangerFlares") then
				--LOG("mech has the right skill!")
				return Board:GetPawn(i)
			end
		end
	end
	return nil
end


local function GetSkillEffect()
	local targets = PointList()
	
	local board_size = Board:GetSize()
	for i = 0, board_size.x - 1 do
		for j = 0, board_size.y - 1  do
			local p = Point(i,j)
			if Board:IsPawnSpace(p) and Board:IsPawnTeam(p,TEAM_ENEMY) then
				targets:push_back(p)
			end
		end
	end
	
	local ret = SkillEffect()
	local user_space = GetUser():GetSpace()
	
	Board:AddAnimation(user_space,"ExploRaining2",6) -- anim flag with no constant for some reason, reverse & full delay
	
	for i = 1, targets:size() do
		ret:AddSound("/weapons/artillery_volley")
		local damage = SpaceDamage(targets:index(i), 0)
		damage.sAnimation = "ExploRaining1"
		damage.iSmoke = EFFECT_CREATE
		ret:AddArtillery(user_space,damage,"effects/shotup_darwin_fireball.png", 0.1) --,NO_DELAY
	end

	return ret
end

local hook = function(mission, pawn, damageTaken)
	if IsUserPresent() and pawn:GetId() == GetUser():GetId() and pawn:GetHealth() == 1 then
		
		modApi:conditionalHook(
			function()
				return Board:IsBusy() ~= true
			end,
			function()
				Board:AddEffect(GetSkillEffect())
			end
		)
	
	end
end

----------------------------------------------- HOOKS / EVENTS SUBSCRIPTION -----------------------------------------------

local function EVENT_onModsLoaded()
	modapiext:addPawnDamagedHook(hook)
end


modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)