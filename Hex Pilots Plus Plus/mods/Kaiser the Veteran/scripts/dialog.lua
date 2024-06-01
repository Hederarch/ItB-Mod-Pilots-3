
-- Adds a personality without the use of a csv file.
-- Table of responses to various triggers.
return {
	-- Game States
	Gamestart = {"Ze engines of war. How zey sing to me.","It is honor to serve, kommandant.","Heil, kommandant. I have allies on ze way.","Lockstep, #squad! Mach schnell!"},
	FTL_Found = {"Stand tall, recruit! Get in ze cockpit!"},
	--FTL_Start = {},
	Gamestart_PostVictory = {"Ze engines of war. How zey sing to me once more."},
	Death_Revived = {"Cannot keep an old dog down zat easy."},
	Death_Main = {"I die with honor.","Keep fighting!"},
	Death_Response = {"Auf Wiedersehen, genosse.","We'll recover ze body later.","Auf Wiedersehen, kamerad."},
	Death_Response_AI = {"#main_mech is scrap now.","#main_mech is junk now."},
	TimeTravel_Win = {"Ha ha! Wunderbar!"},
	Gameover_Start = {"Halt! Ze power is failing!","Halt! Ze power is dying!","Halt! Ze power is fading!"},
	Gameover_Response = {"Never give in, never surrender!","We did what we could. Get to safety!","We have failed. Get to safety!"},
	
	-- UI Barks
	Upgrade_PowerWeapon = {"Reminds me of mein artillerie.","What's ze caliber on zis one?","Very wise, kommandant."},
	Upgrade_NoWeapon = {"Very unwise, kommandant.","Dummkopf."},
	Upgrade_PowerGeneric = {"Loaded up. We go!","Thank you.","Very wise, kommandant."},
	
	-- Mid-Battle
	MissionStart = {"Lockstep, everyone!","Schneller, schneller!","Let me hear you roar!","Raus! Raus!"},
	Mission_ResetTurn = {"Auf Wiedersehen!","Schneller, schneller!"},
	MissionEnd_Dead = {"What a bloodbath.","Stupendous!","Ho ho ho! What fun!"},
	MissionEnd_Retreat = {"Schweinhunde!","Run, cowards!"},

	MissionFinal_Start = {"We strike ze heart of ze beast now!","We dive to ze heart of ze swarm now!"},
	MissionFinal_StartResponse = {"We will not fail. Not now.","Feed the fire within! Burn the Vek with your fury!"},
	--MissionFinal_FallStart = {},
	MissionFinal_FallResponse = {"Scheiße!","Schweinhunds!"},
	--MissionFinal_Pylons = {},
	MissionFinal_Bomb = {"Ze belly of ze beast, eh?"},
	--MissionFinal_BombResponse = {},
	MissionFinal_CaveStart = {"You have your orders! Chins up, #squad!","You have your orders! Stand tall, #squad!","You have your orders! Horrido!"},
	--MissionFinal_BombDestroyed = {},
	MissionFinal_BombArmed = {"Raus, raus! Ze bomb is ready!","Schneller, schneller! Ze bomb is ready!"},

	PodIncoming = {"Shells incoming!","Watch ze skies!"},
	PodResponse = {"Who dropped zis?","It's ours now, right?"},
	PodCollected_Self = {"Ach, was ist das?","Danke."},
	PodDestroyed_Obs = {"Scheiße."},
	Secret_DeviceSeen_Mountain = {"Ze mountain, it's glowing!"},
	Secret_DeviceSeen_Ice = {"Ze water, it's glowing!"},
	Secret_DeviceUsed = {"Ach, was ist das?"},
	Secret_Arriving = {"Shells incoming. Big ones."},
	Emerge_Detected = {"More Vek for ze killing fields.","Ze cowards brought more."},
	Emerge_Success = {"Hold ze line!","You will go no furzher!"},
	Emerge_FailedMech = {"Get behind me!","And stay down!"},
	Emerge_FailedVek = {"Dummkopfs.","Schweinhunde."},

	-- Mech State
	Mech_LowHealth = {"You are trying mein patience!","I am wasted on zis team."},
	Mech_Webbed = {"Get your claws off me!","I will not be stopped!"},
	Mech_Shielded = {"Shield is in position!","I'm invincible!"},
	Mech_Repaired = {"I'm back!","All patched up.","I am so good, ja!","Ze healing is not as rewarding as ze hurting."},
	Pilot_Level_Self = {"I am ze Übermensch!"},
	Pilot_Level_Obs = {"Gut gemacht, #main_second.", "Well done, kamerad."},
	Mech_ShieldDown = {"Hold ze line!","No damage!"},

	-- Damage Done
	Vek_Drown = {"It is drowning!","Ze Vek is drowning!","Watch out for ze water, ja?"},
	Vek_Fall = {"It is crushed!","Ze Vek is crushed!","Watch out for ze holes, ja?"},
	Vek_Smoke = {"It is blind!","Ze Vek is blind!"},
	Vek_Frozen = {"Stay zere!","Hmm... later..."},
	VekKilled_Self = {"Not bad, ja?","Ho ho!","Zis is exciting!.","Ha! Take zat!"},
	VekKilled_Obs = {"What schaudenfreude!","I like your moves, ja!","Well done, kamerad!"},
	VekKilled_Vek = {"Dummkopfs.","Schweinhunde."},

	DoubleVekKill_Self = {"Ein, zwei, drei... ze Vek are just tallies to me."},
	DoubleVekKill_Obs = {"What schaudenfreude!","I like your moves, ja!","Well done, kamerad!"},
	DoubleVekKill_Vek = {"What a Dummkopffest!"},

	MntDestroyed_Self = {"Ze mountain was no match for me.","Zis power... mein gott!"},
	MntDestroyed_Obs = {"Shoot ze bugs next time, dummkopf."},
	MntDestroyed_Vek = {"Dummkopfs."},

	PowerCritical = {"Defend ze grid! Mach schnell!","We are losing! Defend ze grid!"},
	Bldg_Destroyed_Self = {"Scheiße!"},
	Bldg_Destroyed_Obs = {"Dummkopf!","Schweinhunde!"},
	Bldg_Destroyed_Vek = {"Schweinhunde!","Scheiße!"},
	Bldg_Resisted = {"Let us do zis!","Move! Schnell!","We got lucky, ja?"},


	-- Shared Missions
	Mission_Train_TrainStopped = {"Ze train is not moving!","Do we push ze train now?"},
	Mission_Train_TrainDestroyed = {"Dummkopfs! Ze train is dead!"},
	Mission_Block_Reminder = {"Hold ze line, kamerades! We keep zem under!"},

	-- Archive
	Mission_Airstrike_Incoming = {"I do not recognize zat bomber. Stay clear."},
	Mission_Tanks_Activated = {"Ooh! Ze tanks are here!"},
	Mission_Tanks_PartialActivated = {"Ooh! Ze tank is here!"},
	Mission_Dam_Reminder = {"Ze dam! Blow it up!"},
	Mission_Dam_Destroyed = {"Ze dam is no more!"},
	Mission_Satellite_Destroyed = {"Ze rocket is no more!"},
	Mission_Satellite_Imminent = {"Move! Schnell!"},
	Mission_Satellite_Launch = {"Raus, raus! Ha ha!"},
	Mission_Mines_Vek = {"Watch out for ze bombs! Ha ha!"},

	-- RST
	Mission_Terraform_Destroyed = {"Der erdbewegungsmaschine! Scheiße!"},
	Mission_Terraform_Attacks = {"What a wunderwaffe."},
	Mission_Cataclysm_Falling = {"Watch ze holes!"},
	Mission_Lightning_Strike_Vek = {"Ha! Wunderbar!"},
	Mission_Solar_Destroyed = {"Ooh, zose aren't going back together."},
	Mission_Force_Reminder = {"Ze mountains! Blow zem up!"},

	-- Pinnacle
	Mission_Freeze_Mines_Vek = {"Hmm... later..."},
	Mission_Factory_Destroyed = {"Der Waffenfabrik! Scheiße!"},
	Mission_Factory_Spawning = {"Überbot incoming!"},
	Mission_Reactivation_Thawed = {"Zey are waking up!"},
	Mission_SnowStorm_FrozenVek = {"Stay zere!"},
	Mission_SnowStorm_FrozenMech = {"Hold ze line!"},
	BotKilled_Self = {"Oh scheiße."},
	BotKilled_Obs = {"Dummkopf! We protect zem!"},

	-- Detritus
	Mission_Disposal_Destroyed = {"Der Zersetzer! Scheiße!"},
	Mission_Disposal_Activated = {"What a wunderwaffe."},
	Mission_Barrels_Destroyed = {"Ha ha! Melt zem all!"},
	Mission_Power_Destroyed = {"Scheiße!"},
	Mission_Teleporter_Mech = {"Woop! Over here, ja!"},
	Mission_Belt_Mech = {"Vroom! Zis way, ja!"},
	
	-- AE
		Mission_ACID_Storm_Start = {"Ze rain here is going right through mein hull."},
		Mission_ACID_Storm_Clear = {"Gesundheit!"},
		Mission_Wind_Mech = {"Woah! Over there, ja!"},
		Mission_Repair_Start = {"Mein mech! What have you done to mein mech?!"},
		Mission_Hacking_NewFriend = {"Ze vek turned it traitor, but no more!"},	
		Mission_Shields_Down = {"Now ze real fight begins."},
}