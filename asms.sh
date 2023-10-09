#AutoSMS 13.09.2023 by sqaw
#Simple sms shortcuts

#<----------{Preparing}---------->

#Getting SMS and num of phones
dbl=$(grep '+' core/autosms | wc -l)+1

#Create time file
cat core/autosms > core/autosms.data
sed -i '1,2d' core/autosms.data

#Create banner
bnnr () {
	clear
	echo ' _____     _           _____ _____ _____ '
	echo '|  _  |_ _| |_ ___ ___|   __|     |   __|'
	echo '|     | | |  _| . |___|__   | | | |__   |'
	echo '|__|__|___|_| |___|   |_____|_|_|_|_____|'
}
#<----------{Functions}---------->

#Mode select menu
menu () {
	bnnr
	echo 'Menu:'
	echo '  [1] Send      SMS'
	echo '  [2] Write     SMS'
	echo '  [3] Delite    SMS'
	echo '  [4] Auto-mode SMS'
	echo '  [0] Exit         '
	read -p 'Mode number:' mode
	if [[ $mode == 0 ]]; then
		clear
		exit 1
	fi
	if [[ $mode == 1 ]]; then
		menu1
	fi
	if [[ $mode == 2 ]]; then
		menu2
	fi
	if [[ $mode == 3 ]]; then
		menu3
	fi
	if [[ $mode == 4 ]]; then
		menua
	fi
}

#Send SMS menu
menu1 () {
	bnnr
	echo $'SMS\x27s:'
        for (( i=1; i < dbl; i++ )); do
                nameh=$(head -n 1 core/autosms.data)
                printf '  ['$i'] '$nameh'\n'
                sed -i '1,3d' core/autosms.data
        done
	read -p 'Select SMS [num]:' smsn
		
	let smsna=($smsn-1)*3+4
	smstn=$(head -n $smsna core/autosms | tail -n 1)
	termux-sms-send -n $smstn
}

#Write SMS menu
menu2 () {
	bnnr
	read -p 'Name: ' wn
	read -p 'To number: ' wnum
	read -p 'Text: ' wtxt
	printf 'Resold:name='$wn';number='$wnum';text='$wtxt
	read -p $'\nIt\x27s correct? [y/n] ' cyn
	if [[ $cyn == Y || $cyn == y ]]; then
		echo '#null.gps' >> core/autosms
		echo $wn >> core/autosms
		echo $wnum' '$wtxt >> core/autosms
	else
		menu2
	fi
}

#Удаляем СМС из core/autosms
menu3 () {
	bnnr
        echo $'SMS\x27s:'
        for (( i=1; i < dbl; i++ )); do
                nameh=$(head -n 1 core/autosms.data)
                printf '  ['$i'] '$nameh'\n'
                sed -i '1,3d' core/autosms.data
        done
	read -p 'Delite SMS [num]: ' dsms
	
	let dsms0=($dsms-1)*3+2
	let dsms1=$dsms0+2
	sed -i $dsms0,$dsms1'd' core/autosms
}
#<----------{Call function}---------->

#Call to menu.
menu

#<----------{Finishing}---------->

#Delite data file
rm core/autosms.data
