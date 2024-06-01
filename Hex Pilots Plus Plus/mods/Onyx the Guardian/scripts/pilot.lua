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
	Id = "Pilot_Barrier_Hedera",					-- id must be unique. Used to link to art assets.
	Personality = "HexBouncer",        -- must match the id for a personality you have added to the game.
	Name = "Onyx",
	Rarity = 2,
	PowerCost = 1,
	Voice = "/voice/ai",				-- audio. look in pilots.lua for more alternatives.
	Skill = "Pilot_Wallmaker",				-- pilot's ability - Must add a tooltip for new skills.
}

CreatePilot(pilot)

-- add assets - notice how the name is identical to pilot.Id
	modApi:appendAsset("img/portraits/pilots/Pilot_Barrier_Hedera.png", path .."img/portraits/pilot.png")
	modApi:appendAsset("img/portraits/pilots/Pilot_Barrier_Hedera_2.png", path .."img/portraits/pilot_2.png")
	modApi:appendAsset("img/portraits/pilots/Pilot_Barrier_Hedera_blink.png", path .."img/portraits/pilot_blink.png")

function this:init(mod)

	replaceRepair:addSkill{
		Name = "Force Fields",
		Description = "As a free action, deploy a line of temporary barriers instead of repairing.",
		weapon = "Pilot_Wallmaker",
		pilotSkill = "Pilot_Wallmaker",
		Icon = "img/weapons/projector_repair.png",
		IsActive = function(pawn)
			if not GAME then return false end
			local mission = GAME.GetMission and GetCurrentMission()
			if not mission then return false end
			return pawn:IsAbility(pilot.Skill) and not pawn:IsFrozen() and not mission.BarriersUsedThisTurn
		end
	}

	---- Parry ----
	Pilot_Wallmaker = Skill:new{
		Name = "Hardlight Field",
		Description = "Deploy a line of temporary barriers. Returns use of movement and weapons afterwards.",
		Icon = "img/weapons/projector_repair.png",
		Damage=1,
		TipImage = {
			Unit = Point(2,4),
			Enemy= Point(0,2),
			Target = Point(2,0),
			Friendly = Point(4,2)
		},
	}
	
	function Pilot_Wallmaker:GetSkillEffect(p1, p2)
		local ret = SkillEffect()
		local direction = GetDirection(p2-p1)
		for i = 1, p1:Manhattan(p2) do
			local curr = p1 + DIR_VECTORS[direction] * i
			if not Board:IsBlocked(curr, PATH_PROJECTILE) then
				local spark = SpaceDamage(curr,0)
				if direction == DIR_UP or direction == DIR_DOWN then
					spark.sPawn = "Deploy_Barrier"
				else
					spark.sPawn = "Deploy_Barrier_Alt"
				end
				ret:AddDamage(spark)
				ret:AddDelay(0.15)
			end
		end
		
		-- Only set the flag on the actual skill, not the tipimage
			if not IsTipImage() then
				ret:AddScript([[
					local mission = GetCurrentMission()
					mission.BarriersUsedThisTurn = true
				]])--update!
			end
		
		ret:AddScript(string.format("Board:GetPawn(Point(%d,%d)):SetActive(true)", p1.x,p1.y))
		return ret
	end
	
end

local function resetUses(mission)
	mission.BarriersUsedThisTurn = false
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
