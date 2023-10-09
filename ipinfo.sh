#IPinfo v0.16 04.08.2023
#Codded by sqaw1

#<----------{Prepair part}----------->

#Create banner
bnnr () {
	printf ' o8o                      o8o               .o88o. \n'
        printf ' `\x22\x27                      `\x22\x27               888 `\x22 \n'
        printf 'oooo  oo.ooooo.          oooo  ooo. .oo.   o888oo   .ooooo.\n'
        printf '`888   888\x27 `88b         `888  `888P\x22Y88b   888    d88\x27 `88b \n'
        printf ' 888   888   888 8888888  888   888   888   888    888   888 \n'
        printf ' 888   888   888          888   888   888   888    888   888 \n'
        printf 'o888o  888bod8P\x27         o888o o888o o888o o888o   `Y8bod8P\x27 \n'
        printf '       888 \n'
        printf '      o888o \n'
	printf '\n \n'
}

#<----------{Function part}---------->

#Create menu
menu () {
	clear
	bnnr
	echo 'Select IP:'
	echo '[01] Your IP'
	echo '[02] Target IP'
	echo '[03] Target-list IP (.txt)'
	echo '[04] LAN to WAN IP (may dont work)'
	echo '[00] Exit'
	read -p 'Target IP:' target_mode

	target_mode_f
}

#Mode
target_mode_f () {
	clear
	bnnr
	if [[ $target_mode == 01 || $target_mode == 1 ]]; then
		curl -s https:/ipapi.co//json | sed 's/"//' | sed  's/"//' | sed 's/"//' | sed 's/"//' | sed '2,27s/,*$//'
		echo ''
	fi
        if [[ $target_mode == 02 || $target_mode == 2 ]]; then
		read -p 'Target IP:' target_ip
		curl -s https:/ipapi.co/$target_ip/json | sed 's/"//' | sed 's/"//' | sed 's/"//' | sed 's/"//' | sed '2,27s/,*$//'
        	echo ''
	fi
	if [[ $target_mode == 03 || $target_mode == 3 ]]; then
		read -p 'Path and name of list (ex. ~/storage/list):' path_list
		cat $path_list >> core/ip.txt
		repeat=$(cat $path_list | wc -l)
		for (( i = 0; i <  $repeat; i++ ))
		do
			target_ip_list=$(head -n 1 core/ip.txt)
			curl -s https:/ipapi.co/$target_ip_list/json | sed 's/"//' | sed 's/"//' | sed 's/"//' | sed 's/"//' | sed '2,27s/,*$//'
			echo ''
			sed -i '1d' core/ip.txt
		done
	fi
	if [[ $target_mode == 04 || $target_mode == 4 ]]; then
		echo 'In develop...'
		sleep 2
		menu
	fi
	if [[ $target_mode == 00 || $target_mode == 0 ]]; then
		clear
		exit 1
	fi

	yorn
}

#Exit dialog
yorn () {
        echo -n 'Exit or back to menu? [0/1]:'
        read yn
        if [[ $yn == 0  ]]; then
                exit 1
        fi
        if [[ $yn == 1 ]]; then
                menu
        fi
        if [[ $yn != 0 || $yn != 1 ]]; then
        echo 'You made a mistake :)'
        sleep 5
        yorn2
        fi
}

#If you don't make a mustake
yorn2 () {
        echo -n 'Exit or back to menu? [0/1]:'
        read yn
        if [[ $yn == 0  ]]; then
                exit 1
        fi
        if [[ $yn == 1 ]]; then
                menu
        fi
        if [[ $yn != 0 || $yn != 1 ]]; then
                echo 'Ты не ошибься... -_-'
                sleep 1
                clear
                exit 1
        fi
}

#<----------{Call part}---------->

menu
