--Mod
local mod = mod_loader.mods[modApi.currentMod]

--Paths
local scriptPath = mod.scriptPath
local resourcePath = mod.resourcePath

--modApi:appendAsset("img/effects/explo_sunrise.png", resourcePath .."img/effects/explo_sunrise.png")


local BURST_UP = "Weapon_Load_Up"
Weapon_Load_Up = Emitter:new{
	image = "combat/icons/icon_doubleshot_glow.png",
	x = -12,
	y = 5,
	max_alpha = 1.0,
	min_alpha = 1.0,
	angle = -90,
	rot_speed = 0,
	angle_variance = 0,
	random_rot = false,
	lifespan = 0.75,
	burst_count = 1,
	speed = 0.75,
	birth_rate = 0,
	gravity = false,
	layer = LAYER_FRONT
}

--------------------------------------------------- UTILITY / LOCAL FUNCTIONS ---------------------------------------------------
local function GetUser()
	for i = 0,2 do
		local mech = Game:GetPawn(i)
		if mech then
			--LOG("ability: " .. mech:GetAbility()) 
			if mech:IsAbility("Flyby") then
				--LOG("mech has the right skill!")
				return Game:GetPawn(i)
			end
		end
	end
	return nil
end

local function IsUserPresent()
	--LOG("[APOLLO] IsApolloPresent()")
	for i = 0, 2 do
		local mech = Game:GetPawn(i)
		--LOG("i: " .. tostring(i))
		if mech then
			--LOG("ability: " .. mech:GetAbility()) 
			if mech:IsAbility("Flyby") then
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
----------------------------------------------- HOOKS HANDLERS -----------------------------------------------


local ApplyEffect = function(mission)
	if IsUserPresent() and Board:GetTurn() < 1 then
		local user = GetUser()
		if user:GetWeaponCount() < 2 then
			mission.KaiserWeaponGet = true
			math.randomseed(os.time())
			local rand = 0
			for i=0,math.random(1,4) do rand = math.random() end -- it's not a good solution, but it works!
			if rand < 0.33 then user:AddWeapon("Pilot_TC_Bombline",true)
			elseif rand > 0.66 then user:AddWeapon("endPilot_FireDrop",true)
						else user:AddWeapon("Pilot_ShockDrop",true) end
			
				modApi:conditionalHook(
				function()
					return Board:GetTurn() == 1
				end,
				function()
					Board:AddBurst(user:GetSpace(),BURST_UP,DIR_NONE)
					Board:Ping(user:GetSpace(),GL_Color(235, 203, 10, 0.75))
				end
			)

			
		end
	end
end

local ender = function(mission)
	if mission.KaiserWeaponGet then
		GetUser():RemoveWeapon(2)
	end
end

----------------------------------------------- HOOKS / EVENTS SUBSCRIPTION -----------------------------------------------


local function EVENT_onModsLoaded()
	modApi:addMissionEndHook(ender)
end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)

--this section detects the event that triggers instantly when End Turn is pressed (PARADOXICA)
EXCL = {
	"GetAmbience", 
	"GetBonusStatus", 
	"BaseUpdate", 
	"UpdateMission", 
	"GetCustomTile", 
	"GetDamage", 
	"GetTurnLimit", 
	"BaseObjectives",
	"UpdateObjectives",
} 

for i,v in pairs(Mission) do 
	if type(v) == 'function' then 
		local oldfn = v 
		Mission[i] = function(...) 
			if not list_contains(_G["EXCL"], i) then 
				if i == "IsEnvironmentEffect" then
					ApplyEffect(GetCurrentMission())
				end 
			end 
			return oldfn(...) 
		end 
	end 
end

