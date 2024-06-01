

-- this line just gets the file path for your mod, so you can find all your files easily.
local path = mod_loader.mods[modApi.currentMod].resourcePath

-- add assets from our mod so the game can find them.
modApi:appendAsset("img/units/mission/kaiser_bomber.png", path .."img/units/kaiser_bomber.png")
modApi:appendAsset("img/units/mission/kaiser_heli.png", path .."img/units/kaiser_heli.png")
modApi:appendAsset("img/units/mission/kaiser_drone.png", path .."img/units/kaiser_drone.png")
modApi:appendAsset("img/weapons/kaiser_bombline.png", path .."img/weapons/kaiser_bombline.png")
modApi:appendAsset("img/weapons/kaiser_firebomb.png", path .."img/weapons/kaiser_firebomb.png")
modApi:appendAsset("img/weapons/kaiser_shocker.png", path .."img/weapons/kaiser_shocker.png")

Pilot_TC_Bombline = Support_TC_Bombline:new{
	Name = "Air Support",
	Description = "Call in an old friend for a bombing run. Destroyed on use.",
	Class = "",
	Icon = "weapons/kaiser_bombline.png",
	TwoClick = true,
	Explosion = "ExploArt1",
	AirstrikeSound = "/weapons/airstrike",
	ExplosionSound = "/impact/generic/explosion",
	Damage = 1,
	PowerCost = 0,
	BuildingDamage = true,
	Limited = 1,
	Upgrades = 0,
	TipImage = {
		Unit = Point(2,3),
		Enemy= Point(4,1),
		Enemy1= Point(3,1),
		Enemy2= Point(2,1),
		Enemy3= Point(1,1),
		Enemy4= Point(0,1),
		Target = Point(2,1),
		Second_Click = Point(3,1)
	},
}

function Pilot_TC_Bombline:GetFinalEffect(p1, p2, p3)
	local ret = SkillEffect()
	local dir = GetDirection(p3 - p2)
	local curr = p2
	local change = VEC_DOWN
	
	ret:AddSound(self.AirstrikeSound)

	if dir == DIR_UP or dir == DIR_DOWN then
		change = VEC_DOWN
		curr = Point(p2.x,0)
		ret:AddReverseAirstrike(curr, "units/mission/kaiser_bomber.png")
	else
		change = VEC_RIGHT
		curr = Point(0,p2.y)
		ret:AddAirstrike(curr, "units/mission/kaiser_bomber.png")
	end
	
	for i = 0, 7 do
		ret:AddSound(self.ExplosionSound)
		local damage = SpaceDamage(curr, self.Damage)
		damage.sAnimation = self.Explosion
		if not self.BuildingDamage and Board:IsBuilding(curr) then	
			damage.iDamage = DAMAGE_ZERO
			damage.sAnimation = "ExploRepulseSmall"
		end 
		ret:AddDamage(damage)
		ret:AddDelay(0.15)
		ret:AddBounce(curr,3)
		
		curr = curr + change
	end
	ret:AddScript(string.format("Board:GetPawn(%d):RemoveWeapon(2)",Board:GetPawn(p1):GetId()))
	return ret
end

Pilot_FireDrop = Grenade_Base:new{  
	Name = "Air Support",
	Description = "Call in an old friend for an incendiary strike. Destroyed on use.",
	Icon = "weapons/kaiser_firebomb.png",
	Class = "",
	Explosion = "",
	PowerCost = 0, 
	InnerAnimation = "explo_fire1",
	LaunchSound = "/weapons/bomber_run",
	Limited = 1,
	Upgrades = 0,
	TipImage = StandardTips.RangedAoe
}	

function Pilot_FireDrop:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	ret:AddSound("/weapons/airstrike")
	ret:AddAirstrike(p2,"units/mission/kaiser_heli.png")
	
	local damage = SpaceDamage(p2,0)
	damage.iFire = 1
	ret:AddDamage(damage)
	
	for i = DIR_START, DIR_END do
		damage = SpaceDamage(p2 + DIR_VECTORS[i],0,i)
		damage.iFire = 1
		ret:AddDamage(damage)
	end
	ret:AddScript(string.format("Board:GetPawn(%d):RemoveWeapon(2)",Board:GetPawn(p1):GetId()))
	return ret
end	

Pilot_ShockDrop = Grenade_Base:new{  
	Name = "Air Support",
	Description = "Call in an old friend for a pulse of electricity. Destroyed on use.",
	Icon = "weapons/kaiser_shocker.png",
	Explosion = "",
	Class = "",
	PowerCost = 0, 
	InnerAnimation = "explo_fire1",
	LaunchSound = "/weapons/bomber_run",
	Limited = 1,
	Upgrades = 0,
	TipImage = {
		Unit = Point(2,3),
		Enemy= Point(4,1),
		Enemy1= Point(3,1),
		Enemy2= Point(2,1),
		Enemy3= Point(1,1),
		Enemy4= Point(0,1),
		Queued1 = Point(3,2),
		Queued2 = Point(2,2),
		Queued3 = Point(1,2),
		Target = Point(2,1),
		
	},
}	

function Pilot_ShockDrop:GetSkillEffect(p1,p2)
	local ret = SkillEffect()
	ret:AddSound("/weapons/airstrike")
	ret:AddAirstrike(p2,"units/mission/kaiser_drone.png")
	
	local damage = SpaceDamage(p2,0,DIR_FLIP)
	damage.sAnimation = "ExploRepulse3"
	ret:AddDamage(damage)
	
	local damage = SpaceDamage(p2,0,DIR_FLIP)
	ret:AddDelay(0.1)
	
	
	for i = DIR_START, DIR_END do
		damage.loc = p2 + DIR_VECTORS[i]
		damage.sAnimation = "ExploRepulseSmall2"
		ret:AddDamage(damage)
	end
		ret:AddDelay(0.1)
	for i = DIR_START, DIR_END do
		damage.loc = p2 + DIR_VECTORS[i] + DIR_VECTORS[i]
		ret:AddDamage(damage)
	end
	ret:AddScript(string.format("Board:GetPawn(%d):RemoveWeapon(2)",Board:GetPawn(p1):GetId()))
	return ret
end	