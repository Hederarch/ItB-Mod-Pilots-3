
-- Adds a personality without the use of a csv file.
-- Table of responses to various triggers.
return {
	-- Game States
	Gamestart = {"Time to build a brighter tomorrow.","Ready to pave the future, commander?","#self_full is here to fight the good fight."},
	FTL_Found = {"What a novel specimen. Why are we letting it pilot, though?"},
	--FTL_Start = {},
	Gamestart_PostVictory = {"Time to build a brighter yesterday."},
	Death_Revived = {"Oh. I'm back?"},
	Death_Main = {"Not to worry, I'll just-","I'm.. oh dear."},
	Death_Response = {"We'll remember you.","Maybe we can... no...","Progress takes sacrifices."},
	Death_Response_AI = {"Progress takes sacrifices.","Rest well, mech."},
	TimeTravel_Win = {"The future is about to get very, very bright."},
	Gameover_Start = {"Oh dear. There goes the power.","The lights are going dark.","We're done for."},
	Gameover_Response = {"We can still salvage this! Breach, and hurry!","We'll come back for them. Maybe.","So much for saving the world..."},
	
	-- UI Barks
	Upgrade_PowerWeapon = {"Fascinating stuff, isn't it?","Oh for me? You shouldn't have.","How kind. I'll take care of it."},
	Upgrade_NoWeapon = {"I have doubts about this plan.","Ha ha. Now hand it back, please.","Rude."},
	Upgrade_PowerGeneric = {"How kind. I'll take care of it.","Oh for me? You shouldn't have.","That'll do nicely.",},
	
	-- Mid-Battle
	MissionStart = {"Alright, time to clock in.","Who's ready to be a hero?","Time to shine, #squad."},
	Mission_ResetTurn = {"Talk about a paradigm shift.","We've turned the future on its head.","How revolutionary."},
	MissionEnd_Dead = {"Onward, to a brighter tomorrow.","Onward, to a cleaner tomorrow.","Onward, to a greater tomorrow.","Onward, to a safer tomorrow."},
	MissionEnd_Retreat = {"Well darn, we just saved the day!","We just saved the day, didn't we?","A job well done, I say."},

	MissionFinal_Start = {"We've gotten too excited. Where's the Grid?","We've surpassed the Grid! We still need it, though.","Now's our chance, #squad! But where's the Grid?"},
	MissionFinal_StartResponse = {"Pylons are coming in hot. Let's save the world.","Pylons in place. Let's save the world."},
	--MissionFinal_FallStart = {},
	MissionFinal_FallResponse = {"This wasn't part of the plan!","Get me out of heeeeeeeeere!"},
	--MissionFinal_Pylons = {},
	MissionFinal_Bomb = {"Uh oh. For once, they've outsmarted us.","So... any bright ideas?"},
	--MissionFinal_BombResponse = {},
	MissionFinal_CaveStart = {"We're at the final stretch now.","Time for the real heroics to start."},
	--MissionFinal_BombDestroyed = {},
	MissionFinal_BombArmed = {"Time's up. Nicely done, #squad.","Time's up. Bye bye Vek!","Time's up. We've just saved the world."},

	PodIncoming = {"Something good's coming up on sensors.","A gift from the future, coming in hot."},
	PodResponse = {"It's genius in a bottle.","It's prosperity in a bottle.","It's progress in a bottle."},
	PodCollected_Self = {"Oh for me? What a surprise!","I've got it! Wonder what's inside?"},
	PodDestroyed_Obs = {"Maybe we can pick through the scraps.","Is the core okay? No it isn't.","We'll make do. Keep moving forward, everyone."},
	Secret_DeviceSeen_Mountain = {"Something really innovative is coming from that mountain."},
	Secret_DeviceSeen_Ice = {"Something really innovative is coming from that lake."},
	Secret_DeviceUsed = {"Let's wait and see, gang.","And now we wait."},
	Secret_Arriving = {"Something really good's coming up on sensors."},
	Emerge_Detected = {"More Vek coming right up!","They're calling for more!"},
	Emerge_Success = {"We can still handle this.","Our weapons should convince them to go back under."},
	Emerge_FailedMech = {"I don't think so, buddy.","Not happening."},
	Emerge_FailedVek = {"Not very courteous, are they?","It's trying to burrow right through the other one."},

	-- Mech State
	Mech_LowHealth = {"Someone cover me real quick.","Is now a bad time? I should go.","Okay, okay! I give up! Can I go now?"},
	Mech_Webbed = {"Oh. I can't move.","Uh... a little help here?"},
	Mech_Shielded = {"That'll keep them off me.","Finally some real protection."},
	Mech_Repaired = {"Now that's an improvement.","I like to think I made it better."},
	Pilot_Level_Self = {"I'm leading by example, really."},
	Pilot_Level_Obs = {"You're full of potential, #main_second."},
	Mech_ShieldDown = {"Woah! What a close one!","At least it wasn't me this time."},

	-- Damage Done
	Vek_Drown = {"I guess it's dealt with.","That one's soaked.","It's not coming back up."},
	Vek_Fall = {"I guess it's dealt with.","Do they go back to the hive when we do that?","It's not coming back up."},
	Vek_Smoke = {"Ha, it's all choked up.","It looks dizzy."},
	Vek_Frozen = {"I guess it's dealt with.","That'll do for now. Just don't let it out.","That's one thorough freeze."},
	VekKilled_Self = {"I'm just sticking up for the little guy.","That one's from Dewey.","That one's from Kern.","That one's from Zenith.","That one's from Singh."},
	VekKilled_Obs = {"Together, we get it done right.","Teamwork makes the dream work.","Excellently done!."},
	VekKilled_Vek = {"It's so inefficient.","They really do that, huh?","I'm more persuasive than I thought."},

	DoubleVekKill_Self = {"Practice makes perfect.","Anyone else want to try that?","Come on, someone do better."},
	DoubleVekKill_Obs = {"Now that's how it's done.","That was downright heroic.","If they were smart, they'd run away when we do that."},
	DoubleVekKill_Vek = {"They really do that, huh?"},

	MntDestroyed_Self = {"I've made the area more efficient.","Boom! No more mountain!","They won't miss it. I think."},
	MntDestroyed_Obs = {"Boom! No more mountain!","They won't miss it. I think."},
	MntDestroyed_Vek = {"Woah. They smashed right through it.","I hate to say it, that's impressive."},

	PowerCritical = {"Uh, guys? Keep an eye on the Grid.","Slow down guys. We can't save the day without Grid."},
	Bldg_Destroyed_Self = {"Progress takes sacrifices.","So much for saving the day..."},
	Bldg_Destroyed_Obs = {"That doesn't count as rescuing them.","So much for saving the day...","Shoot AWAY from the buildings!"},
	Bldg_Destroyed_Vek = {"Progress takes sacrifices.","So much for saving the day...","Uh... it was for the greater good?"},
	Bldg_Resisted = {"Haha! No damage!","That's a relief.","Barely a scratch on that one!"},

	-- Shared Missions
	Mission_Train_TrainStopped = {"Don't worry everyone! We've got this under control!"},
	Mission_Train_TrainDestroyed = {"That doesn't count as rescuing them."},
	Mission_Block_Reminder = {"We can't let them keep getting out!"},

	-- Archive
	Mission_Airstrike_Incoming = {"Look at them go! Everyone's doing their part."},
	Mission_Tanks_Activated = {"Many hands make light work. Welcome!"},
	Mission_Tanks_PartialActivated = {"Every little bit helps. Welcome!"},
	Mission_Dam_Reminder = {"I'm afraid the dam has to go."},
	Mission_Dam_Destroyed = {"What a pretty river."},
	Mission_Satellite_Destroyed = {"So much promise lost."},
	Mission_Satellite_Imminent = {"Watch this, it's gonna be great."},
	Mission_Satellite_Launch = {"Another job well done."},
	Mission_Mines_Vek = {"A reminder to watch your step, everyone."},

	-- RST
	Mission_Terraform_Destroyed = {"Uh... it was for the greater good?"},
	Mission_Terraform_Attacks = {"Talk about an upheval!"},
	Mission_Cataclysm_Falling = {"The ground here's having a real paradigm shift."},
	Mission_Lightning_Strike_Vek = {"An electrifying display!"},
	Mission_Solar_Destroyed = {"Oh dear. That's not going back together."},
	Mission_Force_Reminder = {"I'm afraid we've got to take care of the mountains, too."},

	-- Pinnacle
	Mission_Freeze_Mines_Vek = {"Just don't let it out."},
	Mission_Factory_Destroyed = {"So much for saving the day..."},
	Mission_Factory_Spawning = {"We should try to save those too."},
	Mission_Reactivation_Thawed = {"Oh. They're getting out!"},
	Mission_SnowStorm_FrozenVek = {"I guess it's dealt with."},
	Mission_SnowStorm_FrozenMech = {"Just a little bad weather."},
	BotKilled_Self = {"Uh... it was for the greater good?"},
	BotKilled_Obs = {"So much for saving the day..."},

	-- Detritus
	Mission_Disposal_Destroyed = {"Uh... it was for the greater good?"},
	Mission_Disposal_Activated = {"We should be building more of these!"},
	Mission_Barrels_Destroyed = {"It's crude, but highly effective."},
	Mission_Power_Destroyed = {"Oh dear. That's not going back together."},
	Mission_Teleporter_Mech = {"How innovative!"},
	Mission_Belt_Mech = {"Now that's some good infrastructure."},
	
	-- AE
		Mission_ACID_Storm_Start = {"This can't be good for the environment..."},
		Mission_ACID_Storm_Clear = {"Now who's going to handle the clean-up?"},
		Mission_Wind_Mech = {"Think of the energy opportunities!"},
		Mission_Repair_Start = {"What's going on?! I can't do this!"},
		Mission_Hacking_NewFriend = {"Looks like we knocked some sense into it."},	
		Mission_Shields_Down = {"Oh dear. Be careful everybody!"},
	--]]
}