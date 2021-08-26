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


// This happens when the plugin is loaded
public void OnPluginStart()
{
	HookEvent("bot_takeover", Event_BotTakeOver, EventHookMode_Post);
}


public Action Event_BotTakeOver(Handle event, const char[] name, bool dontBroadcast)
{
	// Obtains the spawned player's userid and stores it within the variable client
	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	// Checks if the player meets our client validation criteria
	if(IsValidClient(client))
	{
		// Checks if a player have a weapon in his primary weapon slot and store the data within the variable Weapon_Primary
		int Weapon_Primary = GetPlayerWeaponSlot(client, 0);

		// Checks if a player have a weapon in his secondary weapon slot and store the data within the variable Weapon_Secondary
		int Weapon_Secondary = GetPlayerWeaponSlot(client, 1);

		// Checks if a player have a weapon in his knife weapon slot and store the data within the variable Weapon_Knife
		int Weapon_Knife = GetPlayerWeaponSlot(client, 2);

		// If the bot had no weapon in the primary weapon slot then execute this section
		if(Weapon_Primary == -1)
		{
			// Calls upon our GivePrimaryWeapon function
			GivePrimaryWeapon(client);
		}

		// If the bot had no weapon in the secondary weapon slot then execute this section
		if(Weapon_Secondary == -1)
		{
			// Calls upon our GiveSecondaryWeapon function
			GiveSecondaryWeapon(client);
		}

		// If the bot had no weapon in the knife weapon slot then execute this section
		if(Weapon_Knife == -1)
		{
			// Gives our player a knife
			GivePlayerItem(client, "weapon_knife");
		}
	}

	return Plugin_Handled;
}


// Gives the player his knife
public Action GivePrimaryWeapon(int client)
{
	// Picks a random number between 1 and 16 and store the picked value within the variable RandomPrimaryChooser
	int RandomPrimaryChooser = GetRandomInt(1, 16);

	// Depending on the number that was picked a different primary weapon will be given to the player
	if(RandomPrimaryChooser == 1)
	{
		GivePlayerItem(client, "weapon_awp");
	}
	else if(RandomPrimaryChooser == 2)
	{
		GivePlayerItem(client, "weapon_ak47");
	}
	else if(RandomPrimaryChooser == 3)
	{
		GivePlayerItem(client, "weapon_m4a1");
	}
	else if(RandomPrimaryChooser == 4)
	{
		GivePlayerItem(client, "weapon_ak47");
	}
	else if(RandomPrimaryChooser == 5)
	{
		GivePlayerItem(client, "weapon_nova");
	}
	else if(RandomPrimaryChooser == 6)
	{
		GivePlayerItem(client, "weapon_negev");
	}
	else if(RandomPrimaryChooser == 7)
	{
		GivePlayerItem(client, "weapon_mag7");
	}
	else if(RandomPrimaryChooser == 8)
	{
		GivePlayerItem(client, "weapon_sg556");
	}
	else if(RandomPrimaryChooser == 9)
	{
		GivePlayerItem(client, "weapon_aug");
	}
	else if(RandomPrimaryChooser == 10)
	{
		GivePlayerItem(client, "weapon_famas");
	}
	else if(RandomPrimaryChooser == 11)
	{
		GivePlayerItem(client, "weapon_galilar");
	}
	else if(RandomPrimaryChooser == 12)
	{
		GivePlayerItem(client, "weapon_ssg08");
	}
	else if(RandomPrimaryChooser == 13)
	{
		GivePlayerItem(client, "weapon_bizon");
	}
	else if(RandomPrimaryChooser == 14)
	{
		GivePlayerItem(client, "weapon_ump45");
	}
	else if(RandomPrimaryChooser == 15)
	{
		GivePlayerItem(client, "weapon_mac10");
	}
	else if(RandomPrimaryChooser == 16)
	{
		GivePlayerItem(client, "weapon_mp9");
	}
}


// Gives the player his knife
public Action GiveSecondaryWeapon(int client)
{
	// Picks a random number between 1 and 10 and store the picked value within the variable RandomSecondaryChooser
	int RandomSecondaryChooser = GetRandomInt(1, 10);

	// Depending on the number that was picked a different secondary weapon will be given to the player
	if(RandomSecondaryChooser == 1)
	{
		GivePlayerItem(client, "weapon_cz75a");
	}
	else if(RandomSecondaryChooser == 2)
	{
		GivePlayerItem(client, "weapon_deagle");
	}
	else if(RandomSecondaryChooser == 3)
	{
		GivePlayerItem(client, "weapon_elite");
	}
	else if(RandomSecondaryChooser == 4)
	{
		GivePlayerItem(client, "weapon_fiveseven");
	}
	else if(RandomSecondaryChooser == 5)
	{
		GivePlayerItem(client, "weapon_glock");
	}
	else if(RandomSecondaryChooser == 6)
	{
		GivePlayerItem(client, "weapon_hkp2000");
	}
	else if(RandomSecondaryChooser == 7)
	{
		GivePlayerItem(client, "weapon_p250");
	}
	else if(RandomSecondaryChooser == 8)
	{
		GivePlayerItem(client, "weapon_revolver");
	}
	else if(RandomSecondaryChooser == 9)
	{
		GivePlayerItem(client, "weapon_tec9");
	}
	else if(RandomSecondaryChooser == 10)
	{
		GivePlayerItem(client, "weapon_usp_silencer");
	}
}


// We call upon this true and false statement whenever we wish to validate our player
bool IsValidClient(int client)
{
	if (!(1 <= client <= MaxClients) || !IsClientConnected(client) || !IsClientInGame(client) || IsClientSourceTV(client) || IsClientReplay(client))
	{
		return false;
	}

	return true;
}