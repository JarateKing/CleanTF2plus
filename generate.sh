#!/bin/sh

# VALIDITY CHECKING

# check wether these exist

if ! test -f "../../tf2_misc_dir.vpk"; then
	echo Error: unable to find tf_misc_dir.vpk. Are you sure CleanTF2plus is inside the custom folder?
	exit 1
fi
if ! test -f "../../tf2_textures_dir.vpk"; then
	echo Error: unable to find tf_textures_dir.vpk. Are you sure CleanTF2plus is inside the custom folder?
	exit 1
fi
if ! test -f "../../../hl2/hl2_textures_dir.vpk"; then
	echo Error: unable to find hl2 vpk\'s. Make sure you\'re not using symbolic links that prevent access to the hl2 folder, and that CleanTF2plus is inside the custom folder.
	exit 1
fi
if ! test -f "../../../bin/vpk_linux32"; then
	echo Error: unable to find bin/vpk_linux32. Make sure you\'re not using symbolic links that prevent access to the bin folder, and that CleanTF2plus is inside the custom folder.
	exit 1
fi


# DATA

# used variables
# these are set through questions
flat=0
nohats=0
playergibs=0
shells=0
weapongibs=0
surfaceproperties=0
soundscapes=0
mtp=0

# obsolete variables
# to manually enable, set to 1 (Not implemented on Linux)
#overlay=0
#fullbright=0

# QUESTIONS

MTP()
{
        echo would you like to add mtp.cfg? Y/N/HELP
        read choice
        
        if [ $choice == "Y" ]; then
		mtp=1
        elif [ $choice == "N" ]; then
		echo
        elif [ $choice == "HELP" ]; then
                echo this sets which maps are affected by pyrovision
        else      
                echo invalid input
		MTP
        fi
}

SOUNDSCAPES()
{
        echo would you like to remove soundscapes? Y/N/Help
        read choice
        
        if [ $choice == "Y" ]; then
		soundscapes=1
		MTP
        elif [ $choice == "N" ]; then
		MTP
        elif [ $choice == "HELP" ]; then
                echo this removes many world sounds from maps
        else      
                echo invalid input
		SOUNDSCAPES
        fi
}

SURFACEPROPERTIES()
{
        echo would you like to add surfaceproperties? Y/N/HELP
        read choice
        
        if [ $choice == "Y" ]; then
		surfaceproperties=2
		SOUNDSCAPES
        elif [ $choice == "N" ]; then
		SOUNDSCAPES
        elif [ $choice == "HELP" ]; then
                echo this removes bullet impacts and gets rid of footstep sounds
        else      
                echo invalid input
                SURFACEPROPERTIES
        fi
}

WEAPONGIBS()
{
        echo would you like to remove weapon gibs? Y/N/HELP
        read choice
        
        if [ $choice == "Y" ]; then
                weapongibs=1
		SURFACEPROPERTIES
        elif [ $choice == "N" ]; then
		SURFACEPROPERTIES
        elif [ $choice == "HELP" ]; then
                echo this removes some gibs from certain projectiles
        else      
                echo invalid input
                WEAPONGIBS
        fi
}

SHELLS()
{
        echo would you like to remove shells from guns? Y/N/HELP 
        read choice
        
        if [ $choice == "Y" ]; then
                shells=1
		WEAPONGIBS
        elif [ $choice == "N" ]; then
                WEAPONGIBS
        elif [ $choice == "HELP" ]; then
                echo this removes the shells that are ejected from some guns
        else      
                echo invalid input
                SHELLS
        fi
}

PLAYERGIBS()
{
        echo would you like to remove player gibs? Y/N/HELP
        read choice
        
        if [ $choice == "Y" ]; then
                playergibs=1
		SHELLS
        elif [ $choice == "N" ]; then
                SHELLS
        elif [ $choice == "HELP" ]; then
                echo this removes the flying body parts when people explode
        else      
                echo invalid input
                PLAYERGIBS
        fi
}

NOHATS_GEN()
{
        echo would you like to keep heads and feet? Y/N/HELP 
        read choice
        
        if [ $choice == "Y" ]; then
                nohats=2
        elif [ $choice == "N" ]; then
                nohats=1
        elif [ $choice == "HELP" ]; then
                echo this keeps cosmetics that replace parts of the body so they aren\'t invisible
        else      
                echo invalid input
                NOHATS_GEN
        fi
}

NOHATS()
{
        echo would you like to remove hats? Y/N/HELP 
        read choice
        
        if [ $choice == "Y" ]; then
                NOHATS_GEN
		PLAYERGIBS
        elif [ $choice == "N" ]; then
                PLAYERGIBS
        elif [ $choice == "HELP" ]; then
                echo this removes all hats and cosmetics from players
		NOHATS
        else      
                echo invalid input
                NOHATS
        fi 
}

FLAT_GEN()
{
        echo would you like flat textures resized? Y/N/HELP
        read choice
 
        if [ $choice == "Y" ]; then
                flat=2
        elif [ $choice == "N" ]; then
                flat=1
        elif [ $choice == "HELP" ]; then
                echo resized flat textures appear mostly flat on sv_pure, non-resized appears as stock tf2 textures
        else
                echo invalid input
                FLAT_GEN
        fi
}

FLAT()
{
	echo would you like flat materials? Y/N/HELP
	read choice

	if [ $choice == "Y" ]; then
		FLAT_GEN
		NOHATS
	elif [ $choice == "N" ]; then
		NOHATS
	elif [ $choice == "HELP" ]; then
		echo flat materials make all world textures one solid color, also known as quake textures
	else
		echo invalid input
		FLAT
	fi
}

FLAT

# GENERATION

rm dev/current_options.txt > /dev/null 2>&1
if [ $flat == 1 ]; then
	echo generating flat textures
	dev/generators/textures_flat.sh dev/lists/linux/flat.txt "../../tf2_textures_dir.vpk"
	dev/generators/textures_flat.sh dev/lists/linux/flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk"
	echo flat textures \(unresized\) >> dev/current_options.txt
	echo done
elif [ $flat == 2 ]; then
	echo generating flat textures
        dev/generators/textures_flat.sh dev/lists/linux/flat.txt "../../tf2_textures_dir.vpk" 1
        dev/generators/textures_flat.sh dev/lists/linux/flat_hl2.txt "../../../hl2/hl2_textures_dir.vpk" 1
        echo flat textures \(resized\) >> dev/current_options.txt
        echo done
fi
if [ $nohats == 1 ]; then
	echo removing hats
	dev/generators/models_null.sh dev/lists/linux/nohats.txt "dev/linux/vpk.sh" "../../tf2_misc_dir.vpk"
	dev/generators/remove.sh dev/lists/linux/nohats_weapons.txt
	echo nohats >> dev/current_options.txt
	echo done
elif [ $nohats == 2 ]; then
        echo removing hats headsfeet
        dev/generators/models_null.sh dev/lists/linux/nohats.txt "dev/linux/vpk.sh" "../../tf2_misc_dir.vpk"
	dev/generators/remove.sh dev/lists/linux/nohats_headsfeet.txt
        dev/generators/remove.sh dev/lists/linux/nohats_weapons.txt
        echo nohats headsfeet >> dev/current_options.txt
        echo done
fi
if [ $playergibs == 1 ]; then
	echo removing player gibs
	dev/generators/models_null.sh dev/lists/linux/model_removal_gibs_player.txt "dev/linux/vpk.sh" "../../tf2_misc_dir.vpk"
	echo no player gibs >> dev/current_options.txt
	echo done
fi
if [ $shells == 1 ]; then
	echo removing shell models
	dev/generators/models_null.sh dev/lists/linux/model_removal_shells.txt "dev/linux/vpk.sh" "../../tf2_misc_dir.vpk"
	echo no shells >> dev/current_options.txt
	echo done
fi
if [ $weapongibs == 1 ]; then
	echo removing weapon gibs
	dev/generators/models_null.sh dev/lists/linux/model_removal_gibs_weapons.txt "dev/linux/vpk.sh" "../../tf2_misc_dir.vpk"
	echo no weapon gibs >> dev/current_options.txt
	echo done
fi
if [ $surfaceproperties == 1 ]; then
	echo adding surfaceproperties
	dev/generators/scripts_copy.sh surfaceproperties_manifest.txt scripts
	dev/generators/scripts_find_and_replace.sh surfaceproperties.txt "REPLACEME" "SolidMetal.StepLeft"
	echo empty surface properties \(metal footseteps\) >> dev/current_options.txt
	echo done
elif [ $surfaceproperties == 2 ]; then
        echo adding surfaceproperties
        dev/generators/scripts_copy.sh surfaceproperties_manifest.txt scripts
        dev/generators/scripts_find_and_replace.sh surfaceproperties.txt "REPLACEME" " "
        echo empty surface properties \(no footseteps\) >> dev/current_options.txt
        echo done
fi
if [ $soundscapes == 1 ]; then
	echo removing soundscapes
	dev/generators/scripts_copy.sh soundscapes_manifest.txt scripts
	echo no soundscapes >> dev/current_options.txt
	echo done
fi
if [ $mtp == 1 ]; then
	echo adding mtp.cfg
	dev/generators/scripts_copy.sh mtp.cfg cfg
	echo no pyrovision textures >> dev/current_options.txt
	echo done
fi

echo thank you for using Clean TF2+
