# OSX-Info.sh
A Bash script for written for use while installing and testing an OSX Image on a PC (primarily for tonymacx86 people).

![](/OSXInfo.jpg)

Overview
--------
The script does not need to be run as root, although it can be. There is only one feature that will need to be run using sudo where, if selected, you will be prompted to enter your password while the script is running. 

Upon launching the script it will automatically check if "Nano" is installed (Nano is not a pre-requisite to run this script). This  check is performed so that once information about your system is printed out, you can then have the option to view your findings in the same terminal. One other feature that is run on start-up will be the resize feature, resizing your terminal window to 80X27, fitting the script. The script is divided in two sections; Information Gathering, Tests & Utilities.

Functions & Features
--------------------

<b> 1. IFORMATION GATHERING: </b>

In this section there are 4 options to choose from, 3 of which will print out a .txt to whatever directory the script was executed from. This then allows the user to copy their OS details to an external drive, or view them from the terminal window if in recovery mode. 

> [1] Print out all information on the system: this will trigger the script to run 'system_profiler'in medium detail, and write           its output to a text file named (SysInfo.txt)

> [2] List all open internet connections: this option will list all connecitons to the internet that are currently being used from your PC. This feature will print this output to the terminal window other than a .txt file.

> [3] List detected usb devices/ports: quite self-explanatory. This option lists all usb ports and devices that are currently detected on the system along with the manufacturer details. Its output is saved to the file (USBInfo.txt).

> [4] List network interfaces: this command output all information relevant to any network settings (IPv4 configuration, IPv6, dns settings, additional routes, etc...). Its output is saved to (NetInfo.txt).

<b> 2. TESTS & UTILITIES: </b>

Under this category there are a list of functions that serve the purpose of testing various features on your system, including hardware.

> [5] Perform a disk check: this function will trigger a 'diskutil verifyVolume /' command, verifying the state of your system drive. A warning message will appear if any corruption is found.

> [6] Check for an internet connection: this command simply runs an nc to google to check for an open and working internet connection and will report back if any issues are found.

> [7] Install all pending updates: this option will run 'softwareupdate -iva', a command that will check for all pending updates to be done on your system and install them automatically. This command only installs updates that are eligible for notification by OSX.

> [8] Batch install applications: this option will open the "macapps" webpage in your default browser.

> [9] Get Multibeast: this option will open the "tonymacx86" downloads page in your default browser, allowing you to download the respective 'Multibeast' app for your system.

> [10] Perform a quick reboot: this is the only command in this script that requires you to run it as 'sudo'. Once selected it will automatically prompt you to enter your root password and fast reboot your PC.

> [11] Test CPU fan: this command should be used with caution as it runs up CPU usage in order to raise the fan speed. Once executed you will be able to hear your CPU fan speed increasing (this option is basically used for determining if there are any imperfections with your CPU fan). This command can be stopped at any time by entering CTRL + C

lICENSING
----------
This script is free to use and share, feel free to distribute it to as many people you wish.
However please do not remove any sections that credit the author. This script is opensource
and open to the public for modification. Please enjoy, share and give me some feedback any time: @Bos3Mq









                   
                                                     ~ Bos3Mq ~ 
                                     
