// List of Includes
#include <sourcemod>
#include <sdktools>
#include <cstrike>

// The code formatting rules we wish to follow
#pragma semicolon 1;
#pragma newdecls required;


// The retrievable information about the plugin itself 
public Plugin myinfo = 
{
	name		= "[CS:GO] Bot Takeover Weaponry",
	author		= "Manifest @Road To Glory",
	description = "Players receive weapons when taking over bots without weapons.", 
	version		= "V. 1.0.0 [Beta]",
	url			= ""
};



//////////////////////////
// - Forwards & Hooks - //
//////////////////////////


// This happens when the plugin is loaded
public void OnPluginStart()
{
	HookEvent("bot_takeover", Event_BotTakeOver, EventHookMode_Post);
}



////////////////
// - Events - //
////////////////


public Action Event_BotTakeOver(Handle event, const char[] name, bool dontBroadcast)
{
	// Obtains the client's userid and converts it to an index and store it within our client variable
	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	// If the client does not meet our validation criteria then execute this section
	if(!IsValidClient(client))
	{
		return Plugin_Continue;
	}

	// Gives the client a knife if one is not equipped by the client already
	GiveKnife(client);

	// Gives the client a primary weapon if one is not equipped by the client already
	GivePrimaryWeapon(client);

	// Gives the client a secondary weapon if one is not equipped by the client already
	GiveSecondaryWeapon(client);

	return Plugin_Continue;
}



///////////////////////////
// - Regular Functions - //
///////////////////////////


// This happens when a player takes over a bot
public void GiveWeapon(int client, bool exactWeapon, const char[] weaponName)
{
	// If the value of exactWeapon is set to true then execute this section
	if(exactWeapon)
	{
		// Creates a healthshot and store it's index within our entity variable
		int entity = CreateEntityByName(weaponName);

		// If the entity does not meet our criteria validation then execute this section
		if(!IsValidEntity(entity))
		{
			return;
		}

		// Creates a variable to store our data within
		float playerLocation[3];

		// Obtains the client's location and store it within the playerLocation variable
		GetEntPropVector(client, Prop_Data, "m_vecOrigin", playerLocation);

		// Spawns the entity
		DispatchSpawn(entity);

		// Teleports the entity to the player's location
		TeleportEntity(entity, playerLocation, NULL_VECTOR, NULL_VECTOR);

		return;
	}

	// Gives the client the specified weapon
	GivePlayerItem(client, weaponName);
}


// This happens when a player takes over a bot
public void GivePrimaryWeapon(int client)
{
	// Stores the weapon in the primary slot within the entity variable
	int entity = GetPlayerWeaponSlot(client, 0);

	// If the entity does not meet the criteria of validation then execute this section
	if(!IsValidEntity(entity))
	{
		return;
	}

	// Picks a random number between 1 and 24 and store it within our randomWeapon variable
	int randomWeapon = GetRandomInt(1, 24);

	// Creates a switch statement to manage outcomes depnding on the value of our variable
	switch(randomWeapon)
	{
		// If the randomWeapon variable is 1 then execute this section
		case 1:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_xm1014");
		}

		case 2:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_sawedoff");
		}

		case 3:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_nova");
		}

		case 4:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_mag7");
		}

		case 5:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_negev");
		}

		case 6:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_m249");
		}

		case 7:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_mac10");
		}

		case 8:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_mp9");
		}

		case 9:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_mp7");
		}

		case 10:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_ump45");
		}

		case 11:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, true, "weapon_mp5sd");
		}

		case 12:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_bizon");
		}

		case 13:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_p90");
		}

		case 14:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_famas");
		}

		case 15:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_galilar");
		}

		case 16:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_sg556");
		}

		case 17:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_aug");
		}

		case 18:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_m4a1");
		}

		case 19:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, true, "weapon_m4a1_silencer");
		}

		case 20:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_ak47");
		}

		case 21:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_ssg08");
		}

		case 22:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_awp");
		}

		case 23:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_scar20");
		}

		case 24:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_g3sg1");
		}
	}
}


// This happens when a player takes over a bot
public void GiveKnife(int client)
{
	// Stores the weapon in the knife slot within the entity variable
	int entity = GetPlayerWeaponSlot(client, 2);

	// If the entity does not meet the criteria of validation then execute this section
	if(!IsValidEntity(entity))
	{
		return;
	}

	// If the player is on the terrorist team then execute this section
	if(GetClientTeam(client) == 2)
	{
		// Gives our player a knife
		GivePlayerItem(client, "weapon_knife_t");

		return;
	}

	// Gives our player a knife
	GivePlayerItem(client, "weapon_knife");
}


// This happens when a player takes over a bot
public void GiveSecondaryWeapon(int client)
{
	// Stores the weapon in the secondary slot within the entity variable
	int entity = GetPlayerWeaponSlot(client, 1);

	// If the entity does not meet the criteria of validation then execute this section
	if(!IsValidEntity(entity))
	{
		return;
	}

	// Picks a random number between 1 and 10 and store it within our randomWeapon variable
	int randomWeapon = GetRandomInt(1, 10);

	// Creates a switch statement to manage outcomes depnding on the value of our variable
	switch(randomWeapon)
	{
		// If the randomWeapon variable is 1 then execute this section
		case 1:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_glock");
		}

		case 2:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_fiveseven");
		}

		case 3:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_tec9");
		}

		case 4:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, true, "weapon_revolver");
		}

		case 5:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_deagle");
		}

		case 6:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_elite");
		}

		case 7:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, false, "weapon_p250");
		}

		case 8:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, true, "weapon_cz75a");
		}

		case 9:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, true, "weapon_hkp2000");
		}

		case 10:
		{
			// Gives the client the specified weapon
			GiveWeapon(client, true, "weapon_usp_silencer");
		}
	}
}



////////////////////////////////
// - Return Based Functions - //
////////////////////////////////


// We call upon this true and false statement whenever we wish to validate our player
bool IsValidClient(int client)
{
	if (!(1 <= client <= MaxClients) || !IsClientConnected(client) || !IsClientInGame(client) || IsClientSourceTV(client) || IsClientReplay(client))
	{
		return false;
	}

	return true;
}
