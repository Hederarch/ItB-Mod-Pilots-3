local path = mod_loader.mods[modApi.currentMod].resourcePath

modApi:appendAsset("img/effects/shockboost_0.png", path .."img/effects/shockboost_0.png")
modApi:appendAsset("img/effects/shockboost_1.png", path .."img/effects/shockboost_1.png")
modApi:appendAsset("img/effects/shockboost_2.png", path .."img/effects/shockboost_2.png")
modApi:appendAsset("img/effects/shockboost_3.png", path .."img/effects/shockboost_3.png")

ANIMS.MetallicaBoost_0 = Animation:new{
	Image = "effects/shockboost_0.png",
	NumFrames = 1,
	Time = 0.8,
	PosX = -38,
	PosY = -42,
	Loop = false
}

ANIMS.MetallicaBoost_1 = Animation:new{
	Image = "effects/shockboost_1.png",
	NumFrames = 1,
	Time = 0.8,
	PosX = -38,
	PosY = -42,
	Loop = false
}

ANIMS.MetallicaBoost_2 = Animation:new{
	Image = "effects/shockboost_2.png",
	NumFrames = 1,
	Time = 0.8,
	PosX = -38,
	PosY = -42,
	Loop = false
}

ANIMS.MetallicaBoost_3 = Animation:new{
	Image = "effects/shockboost_3.png",
	NumFrames = 1,
	Time = 0.8,
	PosX = -38,
	PosY = -42,
	Loop = false
}