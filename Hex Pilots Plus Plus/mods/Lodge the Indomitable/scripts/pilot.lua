local this={}

-- this line just gets the file path for your mod, so you can find all your files easily.
local path = mod_loader.mods[modApi.currentMod].resourcePath

local function IsTipImage()
	return Board:GetSize() == Point(6, 6)
end

-- read out other files and add what they return to variables.
local mod = modApi:getCurrentMod()
local scriptPath = modApi:getCurrentMod().scriptPath
local replaceRepair = require(scriptPath.."replaceRepair/replaceRepair")

local pilot = {
	Id = "Pilot_Lodge_Hedera",					-- id must be unique. Used to link to art assets.
	Personality = "HexLodge",        -- must match the id for a personality you have added to the game.
	Name = "Lodge",
	Rarity = 2,
	PowerCost = 1,
	Voice = "/voice/ai",				-- audio. look in pilots.lua for more alternatives.
	Skill = "Pilot_Barbarian",				-- pilot's ability - Must add a tooltip for new skills.
}

CreatePilot(pilot)

-- add assets - notice how the name is identical to pilot.Id
	modApi:appendAsset("img/portraits/pilots/Pilot_Lodge_Hedera.png", path .."img/portraits/pilot.png")
	modApi:appendAsset("img/portraits/pilots/Pilot_Lodge_Hedera_2.png", path .."img/portraits/pilot_2.png")
	modApi:appendAsset("img/portraits/pilots/Pilot_Lodge_Hedera_blink.png", path .."img/portraits/pilot_blink.png")

	modApi:appendAsset("img/effects/explo_hex_zap.png", path .."img/effects/explo_hex_zap.png")
	ANIMS.explozap = Animation:new{
		Image = "effects/explo_hex_zap.png",
		NumFrames = 12,
		Time = 0.05,
		
		PosX = -33,
		PosY = -14
	}

function this:init(mod)

	replaceRepair:addSkill{
		Name = "Overdrive",
		Description = "Instead of moving, can charge and damage adjacent tiles, and gain Boost. Can no longer repair.",
		weapon = "Pilot_Dud",
		pilotSkill = "Pilot_Barbarian",
		Icon = "img/weapons/no_repair.png",
		IsActive = function(pawn)
			if not GAME then return false end
			local mission = GAME.GetMission and GetCurrentMission()
			if not mission then return false end
			return pawn:IsAbility(pilot.Skill) and (GetCurrentMission().DriveUsedThisTurn or pawn:IsMovementSpent())
		end
	}
	
	replaceRepair:addSkill{
		Name = "Overdrive",
		Description = "Instead of moving, can charge and damage adjacent tiles, and gain Boost. Can no longer repair.",
		weapon = "Pilot_Barbarian",
		pilotSkill = "Pilot_Barbarian",
		Icon = "img/weapons/overdrive_repair.png",
		IsActive = function(pawn)
			if not GAME then return false end
			local mission = GAME.GetMission and GetCurrentMission()
			if not mission then return false end
			return pawn:IsAbility(pilot.Skill) and (not GetCurrentMission().DriveUsedThisTurn and not pawn:IsMovementSpent())
		end
	}

	---- Parry ----
	Pilot_Barbarian = Skill:new{
		Name = "Power Drive",
		Description = "Dash forwards, explode adjacent tiles, and gain Boost. Returns use of weapons.",
		Icon = "img/weapons/overdrive_repair.png",
		Damage=1,
		--PathSize = 8,
		TipImage = {
			Unit = Point(1,2),
			Enemy = Point(3,1),
			Enemy1 = Point(3,3),
			Target = Point(3,2),
		},
	}
	
	function Pilot_Barbarian:GetSkillEffect(p1, p2)
		local ret = SkillEffect()
		
		if GetCurrentMission().DriveUsedThisTurn and not IsTipImage() then
			Board:AddAlert(p1,"ALREADY USED THIS TURN")
			return ret
		end
		
		local direction = GetDirection(p2 - p1)

		local pathing = PATH_PROJECTILE

		local doDamage = true
		local target = p2
		local postDash = p2
		local distance = p1:Manhattan(target)
		
		if not Board:IsBlocked(target,pathing) then -- dont attack an empty edge square, just run to the edge
			doDamage = false
			target = target + DIR_VECTORS[direction]
		end
		postDash = target - DIR_VECTORS[direction]
		
		ret:AddCharge(Board:GetSimplePath(p1, postDash), FULL_DELAY)--FULL_DELAY)
	
		if Board:IsBlocked(p2,PATH_MASSIVE) and postDash:Manhattan(p1) == 0 then postDash = p1 end -- bandaid fix for not moving lol
		
		for i = DIR_START,DIR_END do
			local spaceDamage = SpaceDamage(postDash + DIR_VECTORS[i], self.Damage, i)
			spaceDamage.sSound = "/impact/generic/explosion"
			spaceDamage.sAnimation = "explopunch1_"..i
			ret:AddDamage(spaceDamage)
		end
		
		local boostfx = SpaceDamage(postDash,0)
		boostfx.sAnimation = "explozap"
		ret:AddDamage(boostfx)
		ret:AddDelay(0.1)
		-- Only set the flag on the actual skill, not the tipimage
			if not IsTipImage() then
				ret:AddScript("GetCurrentMission().DriveUsedThisTurn = true")
			end
		ret:AddBounce(postDash,2)
		ret:AddScript(string.format("local pawn = Board:GetPawn(Point(%d,%d)) pawn:SetActive(true) pawn:SetBoosted(true) pawn:SetMovementSpent(true)", postDash.x, postDash.y))
		
		return ret
	end
	
end

	Pilot_Dud = Skill:new{
		Name = "Can't Repair",
		Description = "Does nothing.",
		Icon = "img/weapons/overdrive_repair.png",
		Damage=1,
		TipImage = {
			Unit = Point(2,2),
			Target = Point(2,2)
		},
	}
	
	function Pilot_Dud:GetTargetArea(point)
		local ret = PointList()
		ret:push_back(point)
		return ret
	end
	
	function Pilot_Dud:GetSkillEffect(p1, p2)
		local ret = SkillEffect()
		return ret
	end

local function resetUses(mission)
	mission.DriveUsedThisTurn = false
end

local function EVENT_onModsLoaded()	
	modApi:addMissionStartHook(function(mission)
		resetUses(mission)
	end)

	modApi:addMissionNextPhaseCreatedHook(function(_, mission)
		resetUses(mission)
	end)

	modApi:addTestMechEnteredHook(function(mission)
		resetUses(mission)
	end)
	
	modApi:addNextTurnHook(function(mission)
		if Game:GetTeamTurn() == TEAM_PLAYER then
			resetUses(mission)
		end
	end)

end

modApi.events.onModsLoaded:subscribe(EVENT_onModsLoaded)

return this
