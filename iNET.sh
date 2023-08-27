#InNET (v1.0b) by sqaw0 2023.08.23 (c)
#UwU

#<----------{Prepair}---------->

#<----------{Settings}---------->

#Var
Dexip=''

#Verbose part:
v () {
	v=$(grep -A 1 'Verbose' core/settings | tail -n 1)
	if [[ $v == y ]]; then
		ynv=yes
		setting+='-v '
	else
		ynv=no
	fi
}

#Debug part:
dg () {
	d=$(grep -A 1 'Debug' core/settings | tail -n 1)
	if [[ $d == y ]]; then
		ynd=yes
		setting+='-d '
	else
		ynd=no
	fi
}

#Spoof part:
s () {
	syn=$(grep -A 1 'Spoof' core/settings | tail -n 1)
	sip=$(grep -A 2 'Spoof' core/settings | tail -n 1)
	if [[ $syn == y && $sip != 0.0.0.0 ]]; then
		ynSex=yes
		setting+='-s '
		setting+=$sip
	else
		ynSex=no
	fi
}

#Decoy part:
dy () {
	dyn=$(grep -A 1 'Decoy' core/settings | tail -n 1)
	dip=$(grep -A 2 'Decoy' core/settings | tail -n 1)
	if [[ $dyn == y && $dip != 0.0.0.0 ]]; then
        	ynDex=yes
		setting+=' -D '
		setting+=$dip
	else
        	ynDex=no
	fi
}

#Format path:
f () {
	fyn=$(grep -A 1 'format' core/settings | tail -n 1)
	ft=$(grep -A 2 'format' core/settings | tail -n 1)
	ftn=$(grep -A 3 'format' core/settings | tail -n 1)
	if [[ $fyn == y && $ft != '#null' && $ftn != '#name' ]]; then
        	ynoXex=yes
		setting+=' '
		setting+=$ft
		setting+=' '
		setting+=$ftn
	else
	        ynoXex=no
	fi
}

#Timing path:
t () {
	tyn=$(grep -A 1 'Timing' core/settings | tail -n 1)
	tt=$(grep -A 2 'Timing' core/settings | tail -n 1)
	if [[ $tyn == y && $tt != '#null' ]]; then
	        ynTex=yes
		setting+=' -T '
		setting+=$tt
	else
	        ynTex=no
	fi
}
#Ports path
op () {
	pyn=$(grep -A 1 'Ports' core/settings | tail -n 1)
	pt=$(grep -A 2 'Ports' core/settings | tail -n 1)
	if [[ $pyn == y && $pt != '#null' ]]; then
		ynOP=open
		setting+=' '
		setting+=$pt
	else
		ynOP=all
	fi
}

vdsdfto () {
	unset setting
	setting=''
	v
	dg
	s
	dy
	f
	t
	op
}

#<----------{Functions}---------->

#banner
bnnr () {
        printf '\e[1;31m888      888b    | 888~~  ~~~88~~~\n'
        printf '888      |Y88b   | 888___    888    \n'
        printf '888 ____ | Y88b  | 888       888    \n'
        printf '888      |  Y88b | 888       888    \n'
        printf '888      |   Y88b| 888       888    \n'
        printf '888      |    Y888 888___    888    \e[0m\n'
}

#menu
menu () {
	clear
	bnnr
	echo 'Shortcuts:'
	echo '  [01] Ping         '
	echo '  [02] Port         '
	echo '  [03] Port  [nc]   '
	echo '  [04] Port  [-A]   '
	echo '  [05] Ports        '
[A	echo '  [06] Ports [-A]   '
	echo '  [07] Ports [-sV]  '
	echo '  [08] Nmap  [Ex]   '
	echo '  [99] Settings     '
	echo '  [00] Exit         '
	read -p 'Shortcut:' sc
	
	#exit
	if [[ $sc == 00 || $sc == 0 ]]; then
		clear
                exit 1
        fi
	
	#extented nmap
	if [[ $sc == 08 || $sc == 8 ]]; then
		clear
		bnnr
		echo '  [01] Nmap ex [Scrypt]            '
		echo '  [02] Nmap ex [custom]            '
		read -p $'Nmap \e[1;31mCODE\e[0m: ' scex
	fi
	if [[ $scex == 01 || $scex == 1 ]]; then
		scryptmap
	fi
	if [[ $scex == 2 ]]; then
		echo 'In develop...'
	fi
	#link
        if [[ $sc == 99 ]]; then
                settinga
        fi

        shortcuts
}

#Scrypt 'map'
scryptmap () {
		clear
		bnnr
		echo 'Scrypt types:'
		echo '  [1]  Authentication <information gathering>    '
		echo '  [2]  Discovery      <information gathering>    '
		echo '  [3]  External       <third party apps>         '
		echo '  [4]  Vuln           <vulnerabilities>          '
		echo '  [5]  Brute          <brute all>                '
		echo '  [6]  Malware        <find virus>               '
		echo '  [7]  Intrusive      <cracking scan device>     '
		echo '  [8]  Dos            <DDoS>                     '
		echo '  [9]  Exploit        <finding errors ind device>'
		echo '  [10] Safe           <idk>                      '
		echo '  [11] .nse           <one scrypt (without .nse)>'
		read -p $'Scrypt type: \e[1;31m' sctp
		printf '\e[0m'
		
		if [[ $sctp == 1 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=auth $ip
		fi
		if [[ $sctp == 2 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=discovery $ip
		fi
		if [[ $sctp == 3 ]]; then                                                 read -p $'IP/port: \e[1;34m' ip
                        read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=external $ip
                fi
		if [[ $sctp == 4 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=vuln $ip
	a	fi
		if [[ $sctp == 5 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=brute $ip
		fi
		if [[ $sctp == 6 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=malware $ip
		fi
		if [[ $sctp == 7 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=intrusive $ip
		fi
		if [[ $sctp == 8 ]]; then
			read -p $'Name script (wthout .nse): \e[1;34m'
			printf '\e[0m'
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=dos $ip
		fi
		if [[ $sctp == 9 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=exploit $ip
		fi
		if [[ $sctp == 10 ]]; then
			read -p $'IP(port): \e[1;34m' ip
			printf '\e[0m'
			nmap $setting --script=safe $ip
		fi
		if [[ $sctp == 10 ]]; then
			read -p $'Script name [.nse]: \e[1;34m' namesc
			printf '\e[0m'
			read -p $'IP(port): \e[1;34m' ip
                        printf '\e[0m'
			nmap $setting --script=namesc $ip
                fi
		exitpth
}

#setting e/r
settinga () {
	clear
	bnnr
	echo 'Settings:'
	echo '  [1] Verbose <'$ynv'>'
	echo '  [2] Debbug  <'$ynd'>'
	echo '  [3] Timing  <'$ynTex'>'
	echo '  [4] Spoof   <'$ynSex'>'
	echo '  [5] Decoy   <'$ynDex'>'
	echo '  [6] Port    <'$ynOP'>'
	echo '  [7] Output  <'$ynoXex'>'
	echo '  [0] Back'
	read -p $'Set[num]: \e[1;35m' sett
	printf '\e[0m'
	
	if [[ $sett == 0 ]]; then
		menu
	fi
	if [[ $sett == 1 ]]; then
		if [[ $ynv == yes ]]; then
			sed -i 5cn/ core/settings
		else
			sed -i 5cy core/settings
		fi
	fi
	if [[ $sett == 2 ]]; then
		if [[ $ynd == yes ]]; then
			sed -i 7cn core/settings
		else
			sed -i 7cy core/settings
		fi
	fi
	if [[ $sett == 3 ]]; then
		if [[ $ynTex == yes ]]; then
			sed -i 19cn core/settings
		else
			sed -i 19cy core/settings
			read -p $'Timing template (higher is faster): \e[1;34m'  ynTexn
			sed -i 20c$ynTexn core/settings
		fi
	fi
	if [[ $sett == 4 ]]; then
			if [[ $ynSex == yes ]]; then
				sed -i 9cn core/settings
			else
				sed -i 9cy core/settings
				read -p $'IP for spoof: \e[1;31m' sfip
				printf '\e[0m'
				sed -i 10c$sfip
			fi
	fi
	if [[ $sett == 5 ]]; then
		if [[ $ynDex == yes ]]; then
			sed -i 12cn core/settings
		else
			sed -i 12cy core/settings
			read -p 'Кол-во IP: ' i
			u=i+1
			for (( a=1; a < u; a++ )); do
				printf 'IP №'$a': '
				read -p $'\e[1;31m' DexipN
				printf '\e[0m'
				Dexip=$Dexip','$DexipN' '
				unset DexipN
			done
		sed -i 13c$Dexip core/settings
		sed -i '13s/\x2C//' core/settings
		fi
	fi
	if [[ $sett == 6 ]]; then
		if [[ $ynOP == open ]]; then
                        sed -i 22cn core/settings
		else
                        sed -i 22cy core/settings
                fi
	fi
	if [[ $sett == 7 ]]; then
	clear
	bnnr
		if [[ $ynoXex == yes ]]; then
			sed -i 15cn core/settings
		else
			sed -i 15cy core/settings
			echo 'Formats:'
			echo '  [1] Normal         '
			echo '  [2] XML            '
			echo '  [3] s|<rIpt kIddi3 '
			echo '  [4] Grepable format'
			read -p $'Format: \e[1;33m' formath #AHHHHH! shitty name...
			printf '\e[0m'
			
			if [[ $formath == 1 ]]; then
				sed -i 16c-oN core/settings
			fi
			if [[ $formath == 2 ]]; then
				sed -i 16c-oX core/settings
			fi
			if [[ $formath == 3 ]]; then
				sed -i 16c-oS core/settings
			fi
			if [[ $formath == 4 ]]; then
				sed -i 16c-oG core/settings
			fi
			
			read -p $'Name [file]: \e[1;33m' formatname
			printf '\e[0m'
			sed -i 17c$formatname core/settings
		fi
	fi
	vdsdfto
	settinga
}

#shortcut
shortcuts () {
	clear
	bnnr
	if [[ $sc == 01 || $sc == 1 ]]; then
		read -p $'IP or Domain: \e[1;34m' ip
		printf '\e[0m'
		ping $ip
	fi
	if [[ $sc == 02 || $sc == 2 ]]; then
		read -p $'IP/port: \e[1;34m' ip
		printf '\e[0m'
		nmap $setting $ip
        fi
	if [[ $sc == 03 || $sc == 3 ]]; then
		read -p $'IP: \e[1;34m' ip
		printf '\e[0m'
		read -p $'Port: \e[1;34m' port
		printf '\e[0m'
		nc -vz $ip $port
        fi
	if [[ $sc == 04 || $sc == 4 ]]; then
		read -p $'IP/port: \e[1;34m' ip
		printf '\e[0m'
		nmap $setting -A $ip
        fi
	if [[ $sc == 05 || $sc == 5 ]]; then
		read -p $'IP: \e[1;34m' ip
		printf '\e[0m'
		read -p $'Port range: \e[1;34m' port
		printf '\e[0m'
		nmap $setting -p$port $ip
        fi
	if [[ $sc == 06 || $sc == 6 ]]; then
		read -p $'IP: \e[1;34m' ip
		printf '\e[0m'
                read -p $'Port range: \e[1;34m' port
		printf '\e[0m'
		nmap $setting -p$port -A $ip
        fi
	if [[ $sc == 07 || $sc == 7 ]]; then
		read -p $'IP: \e[1;34m' ip
		printf '\e[0m'
                read -p $'Port range: \e[1;34m' port
		printf '\e[0m'
		nmap $setting -sV -p$port $ip
        fi
	exitpth
}

#Exit dialog
exitpth () {
        echo -n 'Exit or back to menu? [0/1]:'
        read yn
        if [[ $yn == 0  ]]; then
                exit 1
        fi
        if [[ $yn == 1 ]]; then
                menu
        fi
        if [[ $yn != 0 || $yn != 1 ]]; then
		exit 1
	fi
}

#Don't see...
pashalka () {
	echo -n $'\e[1;31mFATAL ERROR!'
	sleep 0.3
	printf '.'
	sleep 0.3
        printf '.'
	sleep 0.3
        printf '.'
	printf '\e[0m'
	sleep 1
	clear
	sleep 3
	echo -n 'starting core'
	sleep 0.1
	printf '.'
	sleep 0.1
        printf '.'
	sleep 0.1
        printf '.\n'
	echo 'starting core:[succses!]'
	echo -n 'load conf files'
	sleep 0.1
        printf '.'
        sleep 0.1
        printf '.'
        sleep 0.1
        printf '.\n'
	echo 'load conf files:[complete!]'
	clear
	echo 'start session'
	echo -n 'login: '
	sleep 0.1
        printf 'C'
        sleep 0.1
        printf 'y'
        sleep 0.1
        printf 'n\n'
	echo -n 'passwrd: '
	sleep 0.9
	clear
	sleep 2
	printf '\e[1;33m'
	for (( w=0; w < 300; w++ )); do
	printf 'null '
	sleep 0.05
	done
	printf '\e[0m'
	clear
	sleep 1
	echo $'Welcome, \e[1;33mCyn\e[0m!'
	sleep 0.5
	echo 'cyn@host:start absolute solwer.'
	sleep 1
	clear
	printf '\e[1;33m'
	echo '                                    .7.                                    '
	echo '                                    Y#Y                                    '
	echo '                                   JBBBJ                                   '
	echo '                                  ?BBBBB?                                  '
	echo '                                 7BBBBBBB7                                 '
	echo '                                !BBBBBBBBB!                                '
	echo '                               .PBBBBBBBBBP.                               '
	echo '                                .^!JBBBJ!^.                                '
	echo '                                    7B7                                    '
	echo '                                    ~B~                                    '
	echo '                                    7#7                                    '
	echo '                                    J#J                                    '
	echo '                                    5B5                                    '
	echo '                                    PBP                                    '
	echo '                                  .7BBB7.                                  '
	echo '                              .^7JYY???YYJ7^.                              '
	echo '                           :!JYY??J5GBG5J??YYJ!:                           '
	echo '                           PP!?YPBBBBBBBBBPY?!PP                           '
	echo '                           PY^BBBBBBBBBBBBBBB^YP                           '
	echo '                           PY~BBBBBBBBBBBBBBB~YP                           '
	echo '                           PY~BBBBBBBBBBBBBBB~YP                           '
	echo '                          ~BY^GBBBBBBBBBBBBBG^YB~                          '
	echo '                       ^?PBBPJ77J5GBBBBBG5J77JPBBP?^                       '
	echo '          .        .~JPBPY!^.~?YYJ??YPY??JYY?~.^!YPBPJ~.        .          '
	echo '        .JP57:  :!YP5J!:        :~?YYJYY?~:        :!J5PY!:  :75PJ.        '
	echo '       !GBBBBGPP5?~:                :~:                :~?5PPGBBBBG!       '
	echo '     ^5BBBBBBBBG.                                         .GBBBBBBBB5^     '
	echo '   .?BBBBBBBBBBB:                                         :BBBBBBBBBBB?.   '
	echo '  !G#BBBGGGP55YJ.                                         .JY55PGGGBBB#G!  '
	echo ' :J?7!~^::..                                                   ..::^~!7?J: '
	sleep 0.3
	clear
	exit 1
}

#<----------{Call functions}---------->

cexit=$((1 + $RANDOM % 100))
if [[ $cexit > 99 ]]; then
	trap pashalka SIGINT
else
	trap exit 1 SIGINT
fi

vdsdfto
menu
