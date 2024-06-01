
-- Adds a personality without the use of a csv file.
-- Table of responses to various triggers.
return {
	-- Game States
	Gamestart = {"Lock and load, #squad.","I'm here for a good time, not a long time.","The Vek won't know what hit 'em."},
	FTL_Found = {"The hell is that?! Get away from the cockpit!"},
	--FTL_Start = {},
	Gamestart_PostVictory = {"The Vek won't know what hit 'em. They never do."},
	Death_Revived = {"Ha! Life finds a way!"},
	Death_Main = {"The damn thing's torn to ribbons! Get me outta here!","The core's going nuclear! Get me outta here!"},
	Death_Response = {"Survival of the fittest.","Oh that's gonna leave a mark.","Not everyone's cut out for this work."},
	Death_Response_AI = {"It'll know better next time.","Get back up you sissy."},
	TimeTravel_Win = {"One mass extinction, coming up!"},
	Gameover_Start = {"Critical damage! I repeat, critical damage!","My mech's locking up! They hit something important!"},
	Gameover_Response = {"Tactical retreat! Everybody out!","At least we get to leave. See ya suckers!","We'll be back. And then they'll be sorry."},
	
	-- UI Barks
	Upgrade_PowerWeapon = {"Niiiiiice.","Can I shoot it yet?","Where's the trigger on this thing?"},
	Upgrade_NoWeapon = {"I oughta kick your ass.","I'll blow you to bits if you don't give that back."},
	Upgrade_PowerGeneric = {"Cool.","This better not explode on me.","Sure, whatever."},
	
	-- Mid-Battle
	MissionStart = {"Lock and load.","Coming in hot!","Active targets! Suppressive fire everybody!","Let's get predatory!"},
	Mission_ResetTurn = {"Man am I glad they can't do this too.","Kill 'em. Then kill 'em again.","Now we know where to shoot 'em."},
	MissionEnd_Dead = {"Nothing like the smell of roasted bug.","Unload and reload, just like always.","All out of ammo. We got them, right?","Boom. That'll keep 'em down."},
	MissionEnd_Retreat = {"And don't come back!","Scurrying away, huh?","We've still thinned the numbers."},

	MissionFinal_Start = {"Stupid tech won't move! Where's the Grid?","Can't shoot anything this far from the Grid."},
	MissionFinal_StartResponse = {"That's more like it. Weapons hot!","That's more like it. Fire at will!"},
	--MissionFinal_FallStart = {},
	MissionFinal_FallResponse = {"Huh?! No fair!","Brace for impact!"},
	--MissionFinal_Pylons = {},
	MissionFinal_Bomb = {"Damn bugs got the drop on us!","We're not getting out of this one."},
	--MissionFinal_BombResponse = {},
	MissionFinal_CaveStart = {"Last one alive, make sure that bomb goes off!","Don't let a single one get away!"},
	--MissionFinal_BombDestroyed = {},
	MissionFinal_BombArmed = {"The bomb's hot! Everybody move out!","It's about to blow! Everybody out!"},

	PodIncoming = {"Something's coming in hot.","Something good's coming. And fast."},
	PodResponse = {"Tactical resupply.","Ammo drop's landed just for us.","Pick it up I guess. Too busy shooting."},
	PodCollected_Self = {"Ha! Load up!","We'll crack that open later."},
	PodDestroyed_Obs = {"At least it didn't explode.","Hope no one was in it.","We don't need it. Keep up the fight!"},
	Secret_DeviceSeen_Mountain = {"Vek signal coming from in that mountain. Blow it up!"},
	Secret_DeviceSeen_Ice = {"Vek signal coming from under that ice. Blow it up!"},
	Secret_DeviceUsed = {"It's calling for backup!"},
	Secret_Arriving = {"Reinforcements incoming. But who are they fighting for?"},
	Emerge_Detected = {"Stomp 'em out!","They're calling for backup!"},
	Emerge_Success = {"More active targets!","If they come up, we'll bury them."},
	Emerge_FailedMech = {"Stay down.","Not today."},
	Emerge_FailedVek = {"That'll keep it down.","It's stuck underground!"},

	-- Mech State
	Mech_LowHealth = {"Flares up! Get 'em while they're stunned!","Flares out! Falling back for repairs.","Don't look at the flares, keep your sights on the Vek.","Flares are live! Rev up those guns, #squad!"},
	Mech_Webbed = {"Stuck at point blank, huh?","Get this damn thing off me!"},
	Mech_Shielded = {"Shields up!","I'm bulletproof!"},
	Mech_Repaired = {"All good in here. Lock and load!","Ready for more!"},
	Pilot_Level_Self = {"King of the jungle! Top of the heap!","Oo-rah!"},
	Pilot_Level_Obs = {"Survival of the fittest, #main_first."},
	Mech_ShieldDown = {"Didn't even feel it.","I'm unstoppable!"},

	-- Damage Done
	Vek_Drown = {"Sink or swim!","No gills on that one.","Take that!"},
	Vek_Fall = {"Kick it when it's down.","Shot down another one.","Stay down."},
	Vek_Smoke = {"Choke on that!","Couldn't take the heat."},
	Vek_Frozen = {"Is it dead?","Saves us the ammo, I guess.","I don't think it's dead."},
	VekKilled_Self = {"Bam!","Boom!","Bang!","Pow!"},
	VekKilled_Obs = {"What a thrill, huh?","Fine shooting, #main_first."},
	VekKilled_Vek = {"Can't aim worth a damn.","What a misfire.","They're terrible shots, aren't they?"},

	DoubleVekKill_Self = {"Bang bang bang!","Dakka dakka dakka! Boom!","Pow! Boom! Got 'em!"},
	DoubleVekKill_Obs = {"What a thrill, huh?","Fine shooting, #main_first."},
	DoubleVekKill_Vek = {"Someone promote that thing."},

	MntDestroyed_Self = {"Area cleared. In style, too.","The mountain couldn't take the heat.","Bang! Down to rubble!"},
	MntDestroyed_Obs = {"Boom! No more mountain!","What an avalanche!"},
	MntDestroyed_Vek = {"Glad it wasn't us.","Can't aim worth a damn."},

	PowerCritical = {"That was a close one. Can't take any more hits!","Not a fatal shot, but close. Don't let it happen again!"},
	Bldg_Destroyed_Self = {"Boom! Wait...","Bang bang... Oh no."},
	Bldg_Destroyed_Obs = {"Watch your fire! Hands off the trigger!","Watch your fire, idiot!","Watch your fire! That was an important one!"},
	Bldg_Destroyed_Vek = {"Blow it to pieces!","We'll hit it back twice as hard.","We've got a lively one! Take it down!"},
	Bldg_Resisted = {"What a bad shot!","Can't aim worth a damn.","It missed! But only barely."},


	-- Shared Missions
	Mission_Train_TrainStopped = {"Clear the area! The train's hit!"},
	Mission_Train_TrainDestroyed = {"The train couldn't take the heat."},
	Mission_Block_Reminder = {"We can save ammo if they don't come up in the first place."},

	-- Archive
	Mission_Airstrike_Incoming = {"Air support coming in hot!"},
	Mission_Tanks_Activated = {"Guns are hot! Lock and load!"},
	Mission_Tanks_PartialActivated = {"Lock and load, little guy!"},
	Mission_Dam_Reminder = {"One good shot and that dam is rubble."},
	Mission_Dam_Destroyed = {"Boom! Clean shot."},
	Mission_Satellite_Destroyed = {"Missile's down. Wasn't armed, though."},
	Mission_Satellite_Imminent = {"Stand back, it's firing!"},
	Mission_Satellite_Launch = {"Boom! Rocket's up and out!"},
	Mission_Mines_Vek = {"Brutal."},

	-- RST
	Mission_Terraform_Destroyed = {"We can still get the Vek without it."},
	Mission_Terraform_Attacks = {"Stay away from that thing. It's a real predtor."},
	Mission_Cataclysm_Falling = {"Stay alert! They're cracking the island!"},
	Mission_Lightning_Strike_Vek = {"Ooh, roast Vek."},
	Mission_Solar_Destroyed = {"Panels are down, back to the fight!"},
	Mission_Force_Reminder = {"Good shooting. Now take some mountains down with 'em!"},

	-- Pinnacle
	Mission_Freeze_Mines_Vek = {"Why not just kill 'em instead?"},
	Mission_Factory_Destroyed = {"Zenith's gonna be mad, but what an explosion!"},
	Mission_Factory_Spawning = {"Hostiles incoming! And not Vek for once!"},
	Mission_Reactivation_Thawed = {"I told you the ice didn't kill 'em."},
	Mission_SnowStorm_FrozenVek = {"Natural selection at work."},
	Mission_SnowStorm_FrozenMech = {"Someone break me out!"},
	BotKilled_Self = {"Bang! Wait, that's a friendly one."},
	BotKilled_Obs = {"Bang! Wait, that's a friendly one."},

	-- Detritus
	Mission_Disposal_Destroyed = {"We can still get the Vek without it."},
	Mission_Disposal_Activated = {"What I wouldn't give to pull the trigger on that."},
	Mission_Barrels_Destroyed = {"Chemical warfare is more fun than you'd think."},
	Mission_Power_Destroyed = {"We've got a lively one! Take it down!"},
	Mission_Teleporter_Mech = {"Huh? Where am I?"},
	Mission_Belt_Mech = {"Damn belts threw off my aim."},
	
	-- AE
		Mission_ACID_Storm_Start = {"Chemical weapons coming from above!"},
		Mission_ACID_Storm_Clear = {"Ugh, finally. My hull's worn clean through."},
		Mission_Wind_Mech = {"How does R.S.T. withstand these winds?!"},
		Mission_Repair_Start = {"What the hell? My mech's falling apart over here!"},
		Mission_Hacking_NewFriend = {"The bot's learned its lesson, right?"},	
		Mission_Shields_Down = {"Now we hit 'em where it hurts."},
	
	--]]
}