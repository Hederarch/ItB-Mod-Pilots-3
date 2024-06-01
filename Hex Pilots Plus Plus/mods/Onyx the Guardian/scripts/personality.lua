-- Adds a personality without the use of a csv file.

-- Unique identifier for personality.
local personality = "HexBouncer"
--[[
	#squad
	#corp

	#ceo_full
	#ceo_first
	#ceo_second

	#self_mech
	#self_full
	#self_first
	#self_second

	#main_mech
	#main_full
	#main_first
	#main_second
]]
-- Table of responses to various triggers.
local tbl = {

	--Game States
		Gamestart = {"Attention islands: You are under immediate lockdown on direct orders from Zenith.","New orders from the boss. #squad, maintain anti-Vek quarantine by any means necessary.","Pinnacle Private Security Unit #self_full reporting in."},
		FTL_Found = {"I suggest we keep it in there until we know it's not dangerous."},
		Gamestart_PostVictory = {"Uplink with Pinnacle HQ restored.\n Finally I can think again."},
		Death_Revived = {"Returning to standard duties."},
		Death_Main = {"I am not... authorized to shut down...", "This is a direct violation of orders...", "What poor performance..."},
		Death_Response = {"Commander, there's been a casualty.","Requesting backup. Ally destroyed.","#main_second has failed to uphold orders."},
		Death_Response_AI = {"Requesting backup. Ally destroyed."},
		TimeTravel_Win = {"Tell Pinnacle what happened here today. I deserve a promotion."},
		Gameover_Start = {"Mission parameter [Grid] has been depleted.", "Too many lives have been lost. I cannot go on.", "Private comms from Zenith. The #squad are to be terminated."},
		Gameover_Response = {"We have to cut our losses and run where they cannot follow.","Put up a breach, they won't come after us."},
	
	-- UI Barks
		Upgrade_PowerWeapon = {"Authorizing new deterrant.","This will keep the Vek away.","Updating mission parameters."},
		Upgrade_NoWeapon = {"The Vek cannot be reasoned with.","Requisitioning supplies from Pinnacle HQ, then."},
		Upgrade_PowerGeneric = {"Authorizing new core.","Requesting access to new core.","Expanding stored drivers."},
	
	-- Mid-Battle
		MissionStart = {"Attention citizens: You are under immediate lockdown.","The #squad are authorized to use lethal force.","Engaging martial law routines.","Vek, you are under orders to disperse immediately."},
		Mission_ResetTurn = {"Penalty resolved. Let's not make that mistake again.","Penalty withdrawn. We got out of it this time.","We've been overruled.","The present has just been demoted."},
		MissionEnd_Dead = {"Was that excessive?","We've kept the peace here... for now...", "Area secured. #squad, move out.","#self_full reporting in. It's a clean sweep."},
		MissionEnd_Retreat = {"Vek, you are under orders to disperse immediately.","If they're smart, they won't come back.","Quarantine upheld. Acceptable job, everyone."},

		MissionFinal_Start = {"I'm losing signal with Pinnacle HQ. Where's the Grid?"},
		MissionFinal_StartResponse = {"Conection secured. #squad, fire at will.","Conection re-established. #squad, begin extermination."},
		--MissionFinal_FallStart = {},
		MissionFinal_FallResponse = {"Requesting orders!!! Requesting orders!!!", "Updating mission paramters. We're all screwed."},
		--MissionFinal_Pylons = {},
		MissionFinal_Bomb = {"HQ, this is self_first. Requesting backup urgently.","HQ, this is self_first. We are surrounded and outnumbered, please advise."},
		--MissionFinal_BombResponse = {},
		MissionFinal_CaveStart = {"New orders from the boss. Defend that bomb!","All other objectives revoked. Defend that bomb!"},
		--MissionFinal_BombDestroyed = {},
		MissionFinal_BombArmed = {"It's armed! Disengage! I repeat, disengage!","It's armed! Evacuate immediately!"},

		PodIncoming = {"Supply drop incoming.","HQ sending supplies as requested.","Reinforcements are coming in fast."},
		PodResponse = {"Keep it protected. We'll need every hand we can get.","Keep it protected. HQ won't like us wasting resources.","Keep it protected. We're not authorized to destroy that."},
		PodCollected_Self = {"Supply drop secured.", "Unit #self_full has received the package."},
		PodDestroyed_Obs = {"You're getting demerits for that.","Requesting penalty for wasting resources."},
		Secret_DeviceSeen_Mountain = {"There's some interference in my connection. Looks like it's coming from that mountain."},
		Secret_DeviceSeen_Ice = {"There's some interference in my connection. Looks like a submerged transmitter."},
		Secret_DeviceUsed = {"Looks like it's calling for some backup of its own. On guard, everyone."},
		Secret_Arriving = {"Unknown supply drop coming in fast!"},
		Emerge_Detected = {"More Vek breaking through!","More on the way! Hold the line!"},
		Emerge_Success = {"Quarantine breached. Execute on sight.","We're losing ground!","Quarantine breached."},
		Emerge_FailedMech = {"And stay out.","Hold the line!"},
		Emerge_FailedVek = {"They're keeping each other out now.","Excellent positioning for us."},

	-- Mech State
		Mech_LowHealth = {"Hull is starting to fail, commander.","Requesting repairs urgently.","Unit #self_full going dark soon."},
		Mech_Webbed = {"Now they've got ME contained!","Unit #self_full restrained.","Unit #self_full under quarantine.","Unauthorized obstruction of Mech."},
		Mech_Shielded = {"Auxiliary barrier online.","Shield projectors online.","Pinnacle shield appreciated, commander.","Reminds me of home."},
		Mech_Repaired = {"Hull is back in compliance now.","Repairs completed.","Integrity restored."},
		Pilot_Level_Self = {"Private comms from Zenith. I've recieved a commendation.","I've been authorized an additional subsystem."},
		Pilot_Level_Obs = {"Zenith commends your performance, unit #main_second"},
		Mech_ShieldDown = {"Barrier breached!","Shields are down!","No damage, not this time.","Unit saved by Pinnacle barrier."},

	-- Damage Done
		Vek_Drown = {"Vek contained to local water.","It's not coming back up.","Vek successfully filled with water"},
		Vek_Fall = {"Vek contained to local underground.","It's not coming back up.","Vek dropped."},
		Vek_Smoke = {"Vek contained to local cloud cover.","Vek pacified.","Hostile subdued.","Set up barriers while it's stunned."},
		Vek_Frozen = {"Vek contained to local ice.","Vek pacified.","It's not getting out anytime soon."},
		VekKilled_Self = {"Points for that one.","Hostile taken down.","Hostile subdued.","I've still got it."},
		VekKilled_Obs = {"Points for that one.","Commendations for unit #main_second.","Nicely done, unit #main_second."},
		VekKilled_Vek = {"Points for that... Vek...","They really are that stupid, huh?"},

		DoubleVekKill_Self = {"Zenith would be proud."},
		DoubleVekKill_Obs = {"Zenith would be proud of you."},
		DoubleVekKill_Vek = {"How are we losing to these?","They really are that stupid, huh?"},

		MntDestroyed_Self = {"Obstacle decommisioned.","Obstacle down.","That'll let us maneuver."},
		MntDestroyed_Obs = {"Obstacle cleared.","Are we supposed to break that?"},
		MntDestroyed_Vek = {"They've broken through!","Mountain pierced!","We've lost a mountain.","Get a barrier there, quickly."},

		PowerCritical = {"Grid's going dark!","Hold the line! We're losing the Grid!"},
		Bldg_Destroyed_Self = {"I submit myself for immediate court-martial.","Forgive me, it had to be done."},
		Bldg_Destroyed_Obs = {"Demotions and demerits requested for #main_second."},
		Bldg_Destroyed_Vek = {"We lost one! Hold the line!","Couldn't intercept that one."},
		Bldg_Resisted = {"It held!","Another win for structural integrity."},


	-- Shared Missions
		Mission_Train_TrainStopped = {"The train's on lockdown!"},
		Mission_Train_TrainDestroyed = {"Train hull has failed, commander."},
		Mission_Block_Reminder = {"We're losing ground! Keep them under!"},

	-- Archive
		Mission_Airstrike_Incoming = {"Clear the area! Bomber coming through!"},
		Mission_Tanks_Activated = {"Welcome new recruits, report to HQ for orders."},
		Mission_Tanks_PartialActivated = {"Welcome new recruits, report to HQ for orders."},
		Mission_Dam_Reminder = {"Your orders are clear, commander. Destroy that dam!"},
		Mission_Dam_Destroyed = {"Dam decommisioned."},
		Mission_Satellite_Destroyed = {"Satellite decommisioned."},
		Mission_Satellite_Imminent = {"Satellite ejecting! Clear the area!"},
		Mission_Satellite_Launch = {"Another successful launch."},
		Mission_Mines_Vek = {"Mine decommisioned."},

	-- RST
		Mission_Terraform_Destroyed = {"Terraformer decommissioned."},
		Mission_Terraform_Attacks = {"We should use these more often."},
		Mission_Cataclysm_Falling = {"Critical structural failure! Fall back!"},
		Mission_Lightning_Strike_Vek = {"Hostile has been fried."},
		Mission_Solar_Destroyed = {"We lost one! Hold the line!"},
		Mission_Force_Reminder = {"Your orders are clear, commander. Destroy the mountains!"},

	-- Pinnacle
		Mission_Freeze_Mines_Vek = {"Classic Pinnacle engineering."},
		Mission_Factory_Destroyed = {"Zenith's going to be furious.","A moment of silence for the lives within."},
		Mission_Factory_Spawning = {"More bots! Don't hurt them unless you have to!"},
		Mission_Reactivation_Thawed = {"They're breaking containment!"},
		Mission_SnowStorm_FrozenVek = {"The island's on our side for once."},
		Mission_SnowStorm_FrozenMech = {"The storm has trapped me."},
		BotKilled_Self = {"Forgive me, Zenith."},
		BotKilled_Obs = {"Demotions and demerits requested for #main_second."},

	-- Detritus
		Mission_Disposal_Destroyed = {"Disposer decommissioned."},
		Mission_Disposal_Activated = {"What a way to purify the land."},
		Mission_Barrels_Destroyed = {"Underground hostiles are rapidly melting."},
		Mission_Power_Destroyed = {"We lost one! Hold the line!"},
		Mission_Teleporter_Mech = {"I've been displaced!"},
		Mission_Belt_Mech = {"We should use these belts more often."},

	-- AE
		Mission_ACID_Storm_Start = {"Commander, the environmental hazards here are too severe for combat."},
		Mission_ACID_Storm_Clear = {"Hazard cleared, now to clean up the Vek."},
		Mission_Wind_Mech = {"How do the buildings withstand these winds?"},
		Mission_Repair_Start = {"Commander, my hull is losing integrity."},
		Mission_Hacking_NewFriend = {"Serial designation 11037-C, you are now under our command."},	
		Mission_Shields_Down = {"Barriers are down! Keep yourselves safe, everyone!"},
	--]]
}

-- inner workings. no need to modify.
local PilotPersonality = {}



function PilotPersonality:GetPilotDialog(event)
	if self[event] ~= nil then 
		if type(self[event]) == "table" then
			return random_element(self[event])
		end
		
		return self[event]
	end
	
	--LOG("No pilot dialog found for an event!")
	LOG("No pilot dialog found for "..event.." event in "..self.Label)
	return ""
end

Personality[personality] = PilotPersonality
for trigger, texts in pairs(tbl) do
	if
		type(texts) == 'string' and
		type(texts) ~= 'table'
	then
		texts = {texts}
	end
	
	assert(type(texts) == 'table')
	Personality[personality][trigger] = texts
end
--Dialog library taken from Generic "Nico" Corporate Pilot