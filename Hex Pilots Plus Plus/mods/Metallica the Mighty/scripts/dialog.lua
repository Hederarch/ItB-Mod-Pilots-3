
-- Adds a personality without the use of a csv file.
-- Table of responses to various triggers.
return {
	-- Game States
	Gamestart = {"[xX_Metallica33_Xx has logged in]","[xX_SniperSupr3m3_Xx has logged in]","[xX_TheLegend27_Xx has logged in]","[xX_VekStomper_Xx has logged in]"},
	FTL_Found = {"[?????????? has logged in]"},
	--FTL_Start = {},
	Gamestart_PostVictory = {"> speedrun time. world record pace"},
	Death_Revived = {"> thats more like it"},
	Death_Main = {"> rigged","> literally rigged","> didnt even hit me","> wtf how"},
	Death_Response = {"[#main_first has logged out]","[#main_second has logged out]","[#main_mech has disconnected]","> !votekick #main_first"},
	Death_Response_AI = {"[#main_mech disconnected]","> !votekick #main_mech","[#main_mech has logged out]"},
	TimeTravel_Win = {"> gg no re"},
	Gameover_Start = {"> huh? we lost???","> wait did we lose","> guys stop we lost"},
	Gameover_Response = {"> rematch!!! i demand a rematch!!!","> no fair!!! literally cheating!!!","> this is so rigged!!! ugh whatever"},
	
	-- UI Barks
	Upgrade_PowerWeapon = {"> new gear equipped","> new gear unlocked","> new gear selected"},
	Upgrade_NoWeapon = {"> huh??? wheres my stuff???","> is this a bug??? wheres my stuff","> im being hacked rn"},
	Upgrade_PowerGeneric = {"> level up","> skill upgraded","> new skills unlocked"},
	
	-- Mid-Battle
	MissionStart = {"> glhf","> hi chat lets get to it","> time to shine team","> they dont stand a chance"},
	Mission_ResetTurn = {"> lag again?","> lagging like crazy rn","> im desyncing"},
	MissionEnd_Dead = {"> yoooo mech sweep!!!","> what a steamroll","> vek failed so hard"},
	MissionEnd_Retreat = {"> at least we won","> we did it chat","> vek lost so im happy"},

	MissionFinal_Start = {"> final mission. begin the countdown","> final mission. its all on the line", "> you must deploy additional pylons"},
	MissionFinal_StartResponse = {"> oh so theyre just buildings again","> ok just pretend theyre buildings"},
	--MissionFinal_FallStart = {},
	MissionFinal_FallResponse = {"> this is so against the rules"},
	--MissionFinal_Pylons = {},
	MissionFinal_Bomb = {"> can i leave now this is just unfair","> can i leave now i give up"},
	--MissionFinal_BombResponse = {},
	MissionFinal_CaveStart = {"> oh sick new objective"},
	--MissionFinal_BombDestroyed = {},
	MissionFinal_BombArmed = {"> bombs done","> the bombs done","> its already over for the vek"},

	PodIncoming = {"> loot drop on sensors","> loot drop incoming"},
	PodResponse = {"> gotta get that","> out of my way i need it","> bonus points for the pod"},
	PodCollected_Self = {"> unboxing video coming soon","> cant wait to open this","> cant wait to score this","> got the loot"},
	PodDestroyed_Obs = {"> aww just missed it","> cant have anything","> aww but i really wanted it"},
	Secret_DeviceSeen_Mountain = {"> glowing mountain??? why???"},
	Secret_DeviceSeen_Ice = {"> glowing water??? why???"},
	Secret_DeviceUsed = {"> chat is this real"},
	Secret_Arriving = {"> legendary loot drop incoming"},
	Emerge_Detected = {"> more vek incoming","> vek coming up","> vek come to join us"},
	Emerge_Success = {"> here they come","> more targets guys"},
	Emerge_FailedMech = {"> spawncamped","> denied","> nuh uh"},
	Emerge_FailedVek = {"> its sabotaging","> theyre griefing each other","> body blocked"},

	-- Mech State
	Mech_LowHealth = {"> so unfair","> mechs breaking down","> almost dead here guys"},
	Mech_Webbed = {"> oh im stuck","> help im stuck","> vek got me stuck"},
	Mech_Shielded = {"> im safe now guys","> finally some protection"},
	Mech_Repaired = {"> fixed it","> healed up","> good as new"},
	Pilot_Level_Self = {"[^LEVEL UP^]"},
	Pilot_Level_Obs = {"[^LEVEL UP^]"},
	Mech_ShieldDown = {"> bubbles gone","> aww my bubble"},

	-- Damage Done
	Vek_Drown = {"> sunk one","> sunk it","> vek sunk"},
	Vek_Fall = {"> downed one","> dropped it","> veks deep down"},
	Vek_Smoke = {"> smokescreen is working","> its in the smokescreen"},
	Vek_Frozen = {"> locked up that one","> veks locked up","> veks timed out","> vek timed out"},
	VekKilled_Self = {"> got one","> loser down","> rip bozo","> gg ez","> vek down"},
	VekKilled_Obs = {"> good shot","> you got it","> we did it chat"},
	VekKilled_Vek = {"> theyre griefing each other","> teamkilled","> oof. teamkill"},

	DoubleVekKill_Self = {"> combo breaker","> poggers","> gg wp"},
	DoubleVekKill_Obs = {"> oh what a shot","> MVP material"},
	DoubleVekKill_Vek = {"> skill issue"},

	MntDestroyed_Self = {"> out of my way","> smashed it"},
	MntDestroyed_Obs = {"> yo you smashed it","> mountain didnt stand a chance"},
	MntDestroyed_Vek = {"> damn they smashed it","> woah they smashed it"},

	PowerCritical = {"> why are we LOSING???","> get it TOGETHER team!!!","> this is just shameful performance guys"},
	Bldg_Destroyed_Self = {"> oops","[user was warned by an admin]"},
	Bldg_Destroyed_Obs = {"> stop griefing","> youre literally throwing","> come on man you know better"},
	Bldg_Destroyed_Vek = {"> oh we missed one","> we gotta do better than this","> the vek are so cheating"},
	Bldg_Resisted = {"> huh??? its okay???","> yo!!! its okay!!!"},


	-- Shared Missions
	Mission_Train_TrainStopped = {"> guys the trains not moving"},
	Mission_Train_TrainDestroyed = {"> oh the trains done for"},
	Mission_Block_Reminder = {"> dont let them out!!!"},

	-- Archive
	Mission_Airstrike_Incoming = {"> dont bomb me ok?"},
	Mission_Tanks_Activated = {"> little guys online"},
	Mission_Tanks_PartialActivated = {"> little guy is online"},
	Mission_Dam_Reminder = {"> i wanna blow up the dam"},
	Mission_Dam_Destroyed = {"> the dam deserved it i think"},
	Mission_Satellite_Destroyed = {"> guys!!! defend the rockets!!!"},
	Mission_Satellite_Imminent = {"> its launching!!!"},
	Mission_Satellite_Launch = {"> satellites up"},
	Mission_Mines_Vek = {"> lol"},

	-- RST
	Mission_Terraform_Destroyed = {"> oh damn the terraformer"},
	Mission_Terraform_Attacks = {"> dont point that at me ok?"},
	Mission_Cataclysm_Falling = {"> um guys the ground is falling"},
	Mission_Lightning_Strike_Vek = {"> zapped it"},
	Mission_Solar_Destroyed = {"> oh the panels are done for"},
	Mission_Force_Reminder = {"> can we blow up some mountains now"},

	-- Pinnacle
	Mission_Freeze_Mines_Vek = {"> just walked right into it huh"},
	Mission_Factory_Destroyed = {"> thats enough bots for now"},
	Mission_Factory_Spawning = {"> can someone stop that please"},
	Mission_Reactivation_Thawed = {"> oh theyre coming out"},
	Mission_SnowStorm_FrozenVek = {"> vek timed out"},
	Mission_SnowStorm_FrozenMech = {"> wait it can freeze me too???"},
	BotKilled_Self = {"> i wasnt supposed to kill that was i"},
	BotKilled_Obs = {"> dude we dont kill those"},

	-- Detritus
	Mission_Disposal_Destroyed = {"> disposers not looking too good"},
	Mission_Disposal_Activated = {"> dont point that at me ok?"},
	Mission_Barrels_Destroyed = {"> theyre not gonna like that"},
	Mission_Power_Destroyed = {"> get it TOGETHER team!!!"},
	Mission_Teleporter_Mech = {"> whee im gone"},
	Mission_Belt_Mech = {"> dont move me"},
	
	-- AE
		Mission_ACID_Storm_Start = {"> wtf it's raining poison"},
		Mission_ACID_Storm_Clear = {"> glad thats over with"},
		Mission_Wind_Mech = {"> woah"},
		Mission_Repair_Start = {"> um why does my mech hurt"},
		Mission_Hacking_NewFriend = {"[friend request accepted]"},	
		Mission_Shields_Down = {"> no!!! our bubbles!!!"},
}