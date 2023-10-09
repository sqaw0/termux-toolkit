#Я заdолбался писать... ААААА.
##IPhoto editor(v0.1pre-a) 21.08.2023 by sqaw0

##<----------{Prepairing}---------->

#settings:
#Use 'fast' path [1]:
fpt=0
fpath=$( tail -n 1 core/dpath ) #this command only read path (this not path to photo)

##<----------{Functions}---------->

#Banner
bnnr () {
	echo ' ___ _        _           _ '
	echo '| _ \ |_  ___| |_ ___ ___(_)'
	echo '|  _/   \/ _ \  _/ _ \___| |'
	echo '|_| |_||_\___/\__\___/   |_|'
}

#stonks?
menu () {
	clear
	bnnr
	echo 'Mods:'
	echo '  [01] Read EXIF info'
	echo '  [02] Delite EXIF info'
	echo '  [00] Exit'
	read -p 'Your mode:' mode


	clear
	bnnr
	if [[ $mode == 01 || $mode == 1 ]]; then
		read -p "Path/name of photo:" fullpath
		exiftool $fullpath
	fi
	if [[ $mode == 02 || $mode == 2 ]]; then
		read -p "Path/name of photo:" fullpath
                exiftool -all= $fullpath
        fi
	if [[ $mode == 00 || $mode == 0 ]]; then
		echo "Пока :3"
		sleep 1
		exit 1
        fi
	exitpth
}

#stonks²
menu2 () {
	clear
        bnnr
        echo 'Mods:'
        echo '  [01] Read EXIF info'
        echo '  [02] Delite EXIF info'
        echo '  [00] Exit'
        read -p 'Your mode:' mode


        clear
        bnnr
        if [[ $mode == 01 || $mode == 1 ]]; then
                read -p "Name of photo:" name
                exiftool $fpath$name
        fi
        if [[ $mode == 02 || $mode == 2 ]]; then
                read -p "Name of photo:" name
                exiftool -all= $fpath$name
        fi
        if [[ $mode == 00 || $mode == 0 ]]; then
                echo "Пока :3"
                sleep 1
                exit 1
        fi
        exitpth
}

#Exit dialog
exitpth () {
        echo -n 'Exit or back to menu? [0/1]:'
        read yn
        if [[ $yn == 0  || $yn == 00 ]]; then
                exit 1
        fi
        if [[ $yn == 1 ]]; then
                if [[ $fpt == 1 ]]; then
			menu2
		else
        		menu
		fi
        fi
        if [[ $yn != 0 || $yn != 1 ]]; then
        echo 'You made a mistake :)'
        sleep 5
        exitpth
        fi
}

#<----------{Call functions}---------->

if [[ $fpt == 1 ]]; then
	menu2
else
	menu
fi
