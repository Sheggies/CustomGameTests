# Fishing system
This document describes the requirements of the fishing system and the basic concept.

## Requirements
- Player can use a fishing rod to fish in bodies of water
- Players can select different baits with the fishing rod
- Depending on the bait, different fishes spawn
- If there's no bait, a player has the chance to catch junk
- The bait can be attached to the rod or removed
- The bait is consumed, when it has been attached and eaten by a fish
- Fishing can only start when the player is on dry land (not swimming, diving, or running)
- Fishing process starts with the player presses down the LMB
- Fishing process is cancelled, when the player presses LMB, starts swimming, diving, running, or unequips the rod
- Fish can only spawn in water
- Catching fishes works only if the hook hits water and stays there
- Upon starting the fishing process, there's a random delay between [a, b] before a fish appears.
- Baits have a set amount of charges before being used up
- Upon fish appearence, the fish will approach the hook and bite between [c, d] times, before disappearing
- Biting the hook will consume a charge of the bait until there is nothing left or the fish bite number has been exceeded
- A bait with less than the full amount of charges can't be taken back into the inventory, but will stay on the hook.
- Partially consumed baits will be lost upon bait swap or removal
- Reeling in the hook after a fish has bitten, will consume the bait and grant the player a fish
---
## Basic architecture
The fishing system is made up of a fishing rod (of type `Tool`), and a fish environment system (of type `ScriptableObject`).
The fish environment system acts as soon as a player starts the fishing session and manages all fishing sessions and their spawns.

### Fish environment system
This system runs actively in the background and reacts on changes of a player's fishing state.
It manages several fishing sessions and creates a separate environment for every session.

A session consists of the player, the player's fishing rod, and the created fishing environment.
The player starts an active fishing session by equiping the fishing rod.
An environment is created when the hook is deployed and sucessfully hits a water surface.
It is closed, when the hook is reeled in or the hook leaves the water surface.

Additionally, it is initialised by reading the configuration files and mapping elements related to each other for later use.

### Fishing rod
---
## Configuration
The system has several configuration files for customisation:
- System configuration file
- Bait configuration file
- Fish configuration file

### System configuration
The system configuration contains general settings for the system and fishing rod.
The following list contains all properties:

- Spawn time range in which a fish spawns (in ticks)
- Throw force range of the fishing rod
- Time to reel in the hook after a bite occurs (in ticks)

### Bait configuration
Contains a list of baits. Each bait provides additional information relevant for the fishing system. Baits are associated with their `uuid`.
A bait has the following properties:

- Name
- Charges

### Fish configuration
Fish configurations contain a list of fish related settings. Fishes are associated with ther `uuid`.
A fish has the following properties:

- Name
- Default lure chance
- Bait related configuration, including lure chance, bite charge size
- Bite count range

The bait related configuration is a list of `uuid` mapped baits and contains the following properties:

- Lure chance from (0, 1]
- Bite size from (0, 1]

The bait charges are reduced by the relative to the bite size.
If a bait has a total of 4 charges and a fish bites of 50% (bize size of 0.5), `ceil(0.5 * totalCharges)` are removed from bait
