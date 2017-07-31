#!/bin/bash
##############################################################

# This is a simple script to help with the wireless download
# of photos from an Android device to a local machine, then
# with the option to secure copy these photos to a local 
# server.

##############################################################

# Set Global Variables
_NewFile="Media$(date +%Y_%m_%d_%H%M%S)"


##############################################################

# Display logo
clear
cat jhart_shell_logo.txt
echo -e "\n"
echo "####################################################################"
echo "####################################################################"
echo -e "\n"
#############################################################

# Here we Create a time stamped file to store the photos from the android device

cd ~/Pictures
mkdir $_NewFile
cd $_NewFile

##############################################################

# Here we take the users android device IP address and download
# the photos and videos using the ftp connection then the script
# will move any movie files into a new Movies foler.
#set -e
echo "This script will pull your photos and movies from your android device.  It will also move any movies to a new Movies folder inside your Pictures folder."
echo -e "\n"
echo "########################################################################"
echo "########################################################################"
while true; do
	echo "Please enter your androids current IP Address."
	read _IpAddr
	echo "You entered your androids IP Address as "$_IpAddr""
	echo "Is your IP address correct? y/n "
	read yn
	if [ "$yn" = "y" ];
		then
			echo "Now going to download your photos, videos, and albums from your android device to your local machines Pictures folder."
			sleep 3
			wget -r -l 3 ftp://"$_IpAddr":3721/DCIM/
			cd ~/Pictures/"$_NewFile"/*/DCIM/
			mkdir Movies
			_MovieTitles="$( find . -iname "*.mp4" -print )"
			mv "$_MovieTitles" Movies/
			break	
	
	fi

done


##############################################################

cd ~/Pictures

##############################################################

# Here we ask the user if they have a local server that they want
# to copy their photos and videos onto from their local machine

while true; do
	echo -e "\n"
	echo "###################################################################"
	echo "###################################################################"
	echo -e "\n"
	echo "Do you want to copy your photos and videos from you local machine to your local server? y/n "
	read _Rspns
	case $_Rspns in
		[Yy]* ) while true; do
			echo "Please enter your local server address (Example "username"@xxx.xxx.xxx:/path/to/local/server/share/folder/)"
			read _SvrAddr
			echo "You entered your local server address as "$_SvrAddr""
			echo "Is your server address correct? y/n "
			read _SvrRspns
				if [ "$_SvrRspns" = "y" ];
					then
						echo "Now going to secure copy your photos and videos to your local server location."
						sleep 3
						scp -r "$_NewFile" "$_SvrAddr"
						echo "All done."
						break
				fi
			done
			break;;
		[Nn]* ) echo "All done."
			break;;
		* ) echo "Please answer with (y) for yes or (n) for no."
	esac
done

##############################################################
# Done Message

echo "Your transfers are complete.  Enjoy and Thank You!  -Jhart"
sleep 3
#############################################################
exit 



