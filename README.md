# CleanTF2plus

A sequel to the original Clean TF2 mod. Designed to provide mods that reduces visual clutter and increase fps.

## Features

CleanTF2+ makes use of batch files to generate mods for you. Being automatically generated means that it:
- stays updated easier
- allows for options to enable or disable
- is a smaller download
- functions offline
- can be tailored to individual needs

## Install

1. Download zip
2. Unzip to custom folder
3. Run generate.bat
4. Select the options you want

&#8203;* Some options can take a while to fully run, because they need to work with huge amounts of files. Taking several minutes can be expected.

## Options

- Flat textures: makes all textures appear as a solid color.
- Overlay Removal: removes some unnecessary overlays that appear on the map.
- Nohats: removes all hats and cosmetic items.
- No Playergibs: removes all gibs that come from players exploding.
- No Shells: removes all shell models ejected from guns.
- No Weapongibs: removes all gibs from certain projectiles (arrows breaking, for instance).
- Surfaceproperties: removes all particle effects bullets hitting walls, and makes all footsteps the same.
- No Soundscapes: removes most ambient sounds on maps.
- mtp.cfg: makes all maps become unaffected by pyrovision.

## Turn into VPK

Having folders inside custom makes load times slower (regardless of contents) and vpk files exist to speed up load times. For this reason, a utility is provided to convert CleanTF2+ into vpk files.

When you have fully generated the options you wanted:
1. Run pack_vpk.bat
2. Move/delete CleanTF2plus folder out of custom (otherwise there is no load time benefit)
