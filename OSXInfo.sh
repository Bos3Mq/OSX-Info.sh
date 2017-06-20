#!/bin/bash
# Written by: 
###############
##  @Bos3Mq  ##
###############

clear
printf '\e[8;27;80t'
bold=$(tput bold)   
normal=$(tput sgr0)
echo -e "${bold}   ___  _____  __  ___       __              _    
  / _ \/ __\ \/ / |_ _|_ _  / _|___       __| |_  
 | (_) \__ \>  <   | || ' \|  _/ _ \  _  (_-| ' \ 
  \___/|___/_/\_\ |___|_||_|_| \___/ (_) /__|_||_|"  

echo "${bold}   Created to save some effort here and there >> ${normal}"
echo ""
command_exists () {
    type "$1" &> /dev/null ;
}
if command_exists nano ; then
    echo -e "[\033[1;32m✓\033[0m]Nano has been detected on your system. "
  else 
    echo "Nano has not been found on your pc. It is not necessary to have nano installed, however it may be usefull for reading your outputs if in recovery mode."
fi
bold=$(tput bold)   
normal=$(tput sgr0)
echo "[?]Select a function to run by number:"
echo ""
echo "${bold}[*]Information Gathering:"
echo "-------------------------${normal}"
echo "[1] Print out all information on the system"
echo "[2] List all open internet connections"
echo "[3] List detected usb devices/ports"
echo "[4] List network interfaces"
echo ""
echo "${bold}[*]Tests & Utilities:"
echo "---------------------${normal}"
echo "[5] Perform a disk check"
echo "[6] Check for an internet connection"
echo "[7] Install all pending updates"
echo "[8] Batch install applications"
echo "[9] Get Multibeast"
echo "[10] Perform a quick reboot"
echo "[11] Test CPU fan"
echo "=========================="
read -p "[#]>> " selection
echo ""
read -p "[!]You have entered $selection, is this correct? [y/n]: " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "Yes" || $prompt == "yes" ]];
 then
echo "[*]Now proceeding to run function #$selection:"
sleep 2s
else [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "NO" ]];
	exit
fi

###################################################
### [1] Print out all information on the system ###
###################################################

if [[ $selection == "1" ]];
	then {

         system_profiler > SysInfo.txt

         } &> /dev/null & PID=$!

printf "[*]Processing... 
[*]["
while kill -0 $PID 2> /dev/null; do 
    printf  "#"
    sleep 1
done
printf "] Complete!"
echo ""
echo -e "[\033[1;32m✓\033[0m]Information save to (SysInfo.txt)"
read -p "[!]Would you like to view its contentes? [y/n]: " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "Yes" || $prompt == "yes" ]];
 then
        nano SysInfo.txt
        else [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "NO" ]];
    exit
fi
fi

##############################################
### [2] List all open internet connections ###
##############################################

if [[ $selection == "2" ]];
  then echo "[*]Now listing all open internet connections..." 
  lsof -i
  echo ""
  echo -e "[\033[1;32m✓\033[0m]Connections listed"
fi
###########################################
### [3] List detected usb devices/ports ###
###########################################

if [[ $selection == "3" ]];
	then	echo "[*]Gathering information on detected usb devices/ports..."
  
         {

         system_profiler SPUSBDataType > USBInfo.txt 

         } &> /dev/null & PID=$!

printf "[*]Processing... 
[*]["
while kill -0 $PID 2> /dev/null; do 
    printf  "#"
    sleep 1
done
printf "] Complete!"
echo ""
echo -e "[\033[1;32m✓\033[0m]Information saved to (USBInfo.txt)"
read -p "[!]Would you like to view its contentes? [y/n]: " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "Yes" || $prompt == "yes" ]];
 then
        nano USBInfo.txt
        else [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "NO" ]];
    exit
fi
fi

###################################
### [4] List network interfaces ###
###################################

if [[ $selection == "4" ]];
  then  echo "[*]Gathering information on network interfaces..."
  
         {

         system_profiler SPNetworkDataType > NetInfo.txt 

         } &> /dev/null & PID=$!

printf "[*]Processing... 
[*]["
while kill -0 $PID 2> /dev/null; do 
    printf  "#"
    sleep 1
done
printf "] Complete!"
echo ""
echo -e "[\033[1;32m✓\033[0m]Information save to (NetInfo.txt)"
read -p "[!]Would you like to view its contentes? [y/n]: " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "Yes" || $prompt == "yes" ]];
 then
        nano NetInfo.txt
        else [[ $prompt == "n" || $prompt == "N" || $prompt == "no" || $prompt == "NO" ]];
    exit
fi
fi

################################
### [5] Perform a disk check ###
################################

if [[ $selection == "5" ]];
  then  echo "[*]Verifying system drive..."
  
       {

         diskutil verifyVolume /; 

         } &> /dev/null & PID=$!         

printf "[*]["
while kill -0 $PID 2> /dev/null; do 
    printf  "#"
    sleep 1
done
printf "] Complete!"
echo ""
echo "[*]Filtering results, please wait..."
if diskutil verifyVolume / | grep -q 'appears to be OK'; then
  echo -e "[\033[1;32m✓\033[0m]The volume El Capitan appears to be free of corruption and safe to use"
else 
    echo -e "[\033[1;31mX\033[0m]You may want to run a volume reapir on your system drive."
fi
fi

############################################
### [6] Check for an internet connection ###
############################################

if [[ $selection == "6" ]];
  then  echo "[*]Checking for an internet connection..."

sleep 2s
     echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1 
if [ $? -eq 0 ]; then
    echo -e "[\033[1;32m✓\033[0m]You are connected to the internet!"
else
    echo -e "[\033[1;31mX\033[0m]System is offline"

        echo "[*]exiting..."
        sleep 1s
        exit
fi
fi

#######################################
### [7] Install all pending updates ###
#######################################

if [[ $selection == "7" ]];
  then  echo "[*]Searching for any pending updates, this may take a while..."

 {

         softwareupdate -iva; 

         } &> /dev/null & PID=$!         

printf "[*]["
while kill -0 $PID 2> /dev/null; do 
    printf  "#"
    sleep 1
done
printf "] Complete!"
echo ""
echo "Filetering results, please wait..."
if softwareupdate -iva | grep -q 'You have installed one or more updates that requires that you restart'; then
    echo "[*]You have installed one or more updates that require that you restart your
computer.  Please restart immediately."
fi
fi

######################################
### [8] Batch install applications ###
######################################

if [[ $selection == "8" ]];
   
 then open http://macapps.link/en
      echo -e "[\033[1;32m✓\033[0m]Function 8 complete."
  fi

##########################
### [9] Get Multibeast ###
##########################

if [[ $selection == "9" ]];
   
 then open https://www.tonymacx86.com/resources/categories/tonymacx86-downloads.3/
      echo -e "[\033[1;32m✓\033[0m]Function 9 complete."
  fi

###################################
### [10] Perform a quick reboot ###
###################################

if [[ $selection == "10" ]];
   
 then 
 if [ "$(id -u)" != "0" ]; then
   echo "[!]Enter your password below to continue >>"
          sudo reboot now 
else
      echo -e "[*]Rebooting now..."
      sudo reboot now 
  fi
fi


#########################
### [11] Test CPU fan ###
#########################

if [[ $selection == "11" ]];
  then  
        echo "[!]This command will now raise cpu fan usage for as long as it is left running."
        echo "[!]To exit this function press CTRL + C"
        sleep 2
        echo "[*]Running up fan usage (listen out)..."
yes "I like fan noise" > /dev/null;
sleep 7 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done  
echo ""
fi

