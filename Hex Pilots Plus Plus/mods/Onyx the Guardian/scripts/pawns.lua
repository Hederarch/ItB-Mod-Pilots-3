local path = mod_loader.mods[modApi.currentMod].resourcePath
BaseUnit = ANIMS.Animation:new { Image = "units/player/mech_punch_1.png", PosX = -19, PosY = -4, Loop = true, Time = 0.3 }
EnemyUnit = BaseUnit:new { Height = 1 }

BaseEmerge = ANIMS.Animation:new { 
				Image = "units/aliens/firefly_1_emerge.png", 
				NumFrames = 10, 
				PosX = -24, 
				PosY = 0, 
				Loop = false, 
				Time = 0.10, 
				Sound = "/enemy/shared/crawl_out",
				Height = 1}

modApi:appendAsset("img/units/aliens/holo_wall.png", path .."img/pawns/holo_wall.png")
modApi:appendAsset("img/units/aliens/holo_walla.png", path .."img/pawns/holo_walla.png")
modApi:appendAsset("img/units/aliens/holo_walle.png", path .."img/pawns/holo_walle.png")
modApi:appendAsset("img/units/aliens/holo_walld.png", path .."img/pawns/holo_walld.png")

ANIMS.holo_wall = EnemyUnit:new{ Image = "units/aliens/holo_wall.png", PosX = -30, PosY = -20 }
ANIMS.holo_walla = EnemyUnit:new{ Image = "units/aliens/holo_walla.png", PosX = -30, PosY = -20, NumFrames = 4 }
ANIMS.holo_walle = BaseEmerge:new{ Image = "units/aliens/holo_walle.png", PosX = -30, PosY = -20, NumFrames = 4 }
ANIMS.holo_walld = EnemyUnit:new{ Image = "units/aliens/holo_walld.png", PosX = -30, PosY = -20, NumFrames = 5, Time = 0.1, Loop = false  }

Deploy_Barrier = Pawn:new{
	Name = "Hologram",
	Health = 1,
	MoveSpeed = 0,
	Image = "holo_wall",
	TempUnit = true,
	Flying = true,
	Pushable = false,
	SoundLocation = "/mech/distance/bombling/",
	DefaultTeam = TEAM_NONE,
	ImpactMaterial = IMPACT_METAL,
	Corpse = false,
	IsPortrait = false,
}

modApi:appendAsset("img/units/aliens/holo_wall_alt.png", path .."img/pawns/holo_wall_alt.png")
modApi:appendAsset("img/units/aliens/holo_wall_alta.png", path .."img/pawns/holo_wall_alta.png")
modApi:appendAsset("img/units/aliens/holo_wall_alte.png", path .."img/pawns/holo_wall_alte.png")
modApi:appendAsset("img/units/aliens/holo_wall_altd.png", path .."img/pawns/holo_wall_altd.png")

ANIMS.holo_wall_alt = EnemyUnit:new{ Image = "units/aliens/holo_wall_alt.png", PosX = -34, PosY = -20 }
ANIMS.holo_wall_alta = EnemyUnit:new{ Image = "units/aliens/holo_wall_alta.png", PosX = -34, PosY = -20, NumFrames = 4 }
ANIMS.holo_wall_alte = BaseEmerge:new{ Image = "units/aliens/holo_wall_alte.png", PosX = -34, PosY = -20, NumFrames = 4 }
ANIMS.holo_wall_altd = EnemyUnit:new{ Image = "units/aliens/holo_wall_altd.png", PosX = -34, PosY = -20, NumFrames = 5, Time = 0.1, Loop = false  }

Deploy_Barrier_Alt = Pawn:new{
	Name = "Hologram",
	Health = 1,
	MoveSpeed = 0,
	Image = "holo_wall_alt",
	TempUnit = true,
	Flying = true,
	Pushable = false,
	SoundLocation = "/mech/distance/bombling/",
	DefaultTeam = TEAM_NONE,
	ImpactMaterial = IMPACT_METAL,
	Corpse = false,
	IsPortrait = false,
}
--]]