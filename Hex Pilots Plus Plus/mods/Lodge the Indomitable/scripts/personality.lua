-- Adds a personality without the use of a csv file.

-- Unique identifier for personality.
local personality = "HexLodge"
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
		Gamestart = {"Awaiting orders, commander.","Get to it.","We go now."},
		FTL_Found = {"Can it fight? Then it fights for us."},
		Gamestart_PostVictory = {"Awaiting further orders, commander."},
		Death_Revived = {"Returning to standard duties."},
		Death_Main = {"Tragic. Carry on.", "Keep going.", "I'm out. Keep going."},
		Death_Response = {"We work harder then.","Unacceptable.","Do better, #main_second."},
		Death_Response_AI = {"We work harder then.","We keep going."},
		TimeTravel_Win = {"Orders complete."},
		Gameover_Start = {"We have failed? We have failed.", "I cannot go on.", "We have lost too much."},
		Gameover_Response = {"We retreat. Shameful.","We must go. Do not mourn them."},
	
	-- UI Barks
		Upgrade_PowerWeapon = {"This will do.","This will work.","That's good."},
		Upgrade_NoWeapon = {"Is this a joke?","You idiot."},
		Upgrade_PowerGeneric = {"Core acknowledged.","For me? Good.","Will this explode?"},
	
	-- Mid-Battle
		MissionStart = {"Out of my way.","We start the killing now.","How many buildings need to survive this?","No holding back now."},
		Mission_ResetTurn = {"Do better.","Don't do it again.","Destroy them again, yes?","We go again."},
		MissionEnd_Dead = {"...More.","Not enough.", "I am done now.","We are done now."},
		MissionEnd_Retreat = {"We stop the killing now.","Cowards.","They retreat. Shameful."},

		MissionFinal_Start = {"Where is the Grid? We cannot go."},
		MissionFinal_StartResponse = {"Now the real hunt begins.","It's showtime."},
		--MissionFinal_FallStart = {},
		MissionFinal_FallResponse = {"Uh oh.", "Unfortunate."},
		--MissionFinal_Pylons = {},
		MissionFinal_Bomb = {"We are surrounded. A noble death to die.","We are surrounded. But we tried."},
		--MissionFinal_BombResponse = {},
		MissionFinal_CaveStart = {"This will explode? Good.","We hope it will work, then."},
		--MissionFinal_BombDestroyed = {},
		MissionFinal_BombArmed = {"If you want to live, you will stop now.","The bomb will take us if we do not go."},

		PodIncoming = {"Incoming.","A pod?","A pod comes."},
		PodResponse = {"Don't waste it.","Get it out of my way.","Someone else grab that."},
		PodCollected_Self = {"Caught it. Back to work.", "Got it. Back to work."},
		PodDestroyed_Obs = {"Useless.","Shameful."},
		Secret_DeviceSeen_Mountain = {"There is spy in that mountain. Destroy it now."},
		Secret_DeviceSeen_Ice = {"There is spy in that ice sheet. Destroy it now."},
		Secret_DeviceUsed = {"It is calling out. Hold for an ambush."},
		Secret_Arriving = {"A strange pod comes."},
		Emerge_Detected = {"More are coming.","More are coming. Stop them!"},
		Emerge_Success = {"More to kill.","Get them out of here.","They will not be out for long."},
		Emerge_FailedMech = {"And stay out.","Out of my way."},
		Emerge_FailedVek = {"It is contained for now.","Foolish bug."},

	-- Mech State
		Mech_LowHealth = {"I am wounded. But not out yet.","I have fought valiantly.","This is my real purpose."},
		Mech_Webbed = {"Get off of me.","Release me now.","You cannot hold me.","Foolish bug, you cannot hold me."},
		Mech_Shielded = {"I am safe now.","Much safer.","Now... I am unstoppable."},
		Mech_Repaired = {"Repaired. This is time wasted.","Fine. Back to the real work.","I could have used this time better."}, --hint at custom repair
		Pilot_Level_Self = {"I deserve no medal for what I've done.","Do not applaud me."},
		Pilot_Level_Obs = {"Are you proud of your actions, #main_second?"},
		Mech_ShieldDown = {"That was nothing.","Not this time.","No."},

	-- Damage Done
		Vek_Drown = {"Now choke.","Now sink.","It is doomed."},
		Vek_Fall = {"Now crash.","Now drop.","It is doomed."},
		Vek_Smoke = {"Now choke.","It is vulnerable now.","Hit it while it is down."},
		Vek_Frozen = {"It is trapped.","It is held for now."},
		VekKilled_Self = {"Another one.","More.","One more.","Now more."},
		--VekKilled_Obs = {""}, He does not compliment them for this.
		VekKilled_Vek = {"Foolish bug.","Shameful."},

		DoubleVekKill_Self = {"Two more.","Still not enough."},
		DoubleVekKill_Obs = {"Good work."},
		DoubleVekKill_Vek = {"I do not believe what I am seeing."},

		MntDestroyed_Self = {"Crushed it.","It is dust now.","Out of my way."},
		MntDestroyed_Obs = {"It is dust now."},
		MntDestroyed_Vek = {"Mountain gone. Not important.","They will not miss that."},

		PowerCritical = {"We are failing. No more may die.","Too much loss. Soon we will be done for."},
		Bldg_Destroyed_Self = {"Out of my way.","I do not apologize."},
		Bldg_Destroyed_Obs = {"Unacceptable."},
		Bldg_Destroyed_Vek = {"Another loss.","It is dust and blood now."},
		Bldg_Resisted = {"They are not dead? Good.","We are spared."},

	-- Shared Missions
		Mission_Train_TrainStopped = {"Train is wounded. But not out yet."},
		Mission_Train_TrainDestroyed = {"It is dust and blood now."},
		Mission_Block_Reminder = {"We cannot let Vek run free on surface."},

	-- Archive
		Mission_Airstrike_Incoming = {"These bombers are reckless. Be wary."},
		Mission_Tanks_Activated = {"Two more for us."},
		Mission_Tanks_PartialActivated = {"One more for us."},
		Mission_Dam_Reminder = {"The dam must die."},
		Mission_Dam_Destroyed = {"The river will clear its debris."},
		Mission_Satellite_Destroyed = {"It is dust and dreams now."},
		Mission_Satellite_Imminent = {"The rocket wakes up. Get away."},
		Mission_Satellite_Launch = {"Farewell."},
		Mission_Mines_Vek = {"Foolish bug."},

	-- RST
		Mission_Terraform_Destroyed = {"It is dust and dirt now."},
		Mission_Terraform_Attacks = {"We could bury them all with this."},
		Mission_Cataclysm_Falling = {"The very ground betrays us."},
		Mission_Lightning_Strike_Vek = {"Nature is cruel."},
		Mission_Solar_Destroyed = {"It is dust and glass now."},
		Mission_Force_Reminder = {"The mountains must fall."},

	-- Pinnacle
		Mission_Freeze_Mines_Vek = {"It is held for now."},
		Mission_Factory_Destroyed = {"The bots within have all died at your hands."},
		Mission_Factory_Spawning = {"Freedom. Now kill it before it turns on us."},
		Mission_Reactivation_Thawed = {"They will not hold for long."},
		Mission_SnowStorm_FrozenVek = {"The island's icy grip took it."},
		Mission_SnowStorm_FrozenMech = {"The island's icy grip took me."},
		BotKilled_Self = {"An act of mercy for you, machine."},
		BotKilled_Obs = {"It was the merciful thing to do."},

	-- Detritus
		Mission_Disposal_Destroyed = {"It is dust and fumes now."},
		Mission_Disposal_Activated = {"We could melt them all with this."},
		Mission_Barrels_Destroyed = {"May it burn a hole to hell."},
		Mission_Power_Destroyed = {"Another loss."},
		Mission_Teleporter_Mech = {"Where am I?"},
		Mission_Belt_Mech = {"Where am I?"},

	-- AE
		Mission_ACID_Storm_Start = {"The air is poison here, who has done this?"},
		Mission_ACID_Storm_Clear = {"Life can claim this area once more."},
		Mission_Wind_Mech = {"Nature is brutal."},
		Mission_Repair_Start = {"I am dying. We all are."},
		Mission_Hacking_NewFriend = {"This machine should be executed for betraying us. After the mission."},	
		Mission_Shields_Down = {"No more second chances."},
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
	LOG("No pilot dialog found for "..event.." event in "..personality)
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