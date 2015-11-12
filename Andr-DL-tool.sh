#!/bin/bash
##############################################################

# This is a simple script to help with the wireless download
# of photos from an Android device to a local machine, then
# with the option to secure copy these photos to a local 
# server.

##############################################################

# Set Global Variables
_NewFile="Photos$(date +%Y+%m+%d+%r)"

##############################################################

# Here we Create a time stamped file to store the photos from the android device

cd ~/Pictures
mkdir $_NewFile
cd $_NewFile

##############################################################

# Here we take the users android device IP address and download
# the photos using the ftp connection

while true; do
	echo "Please enter your androids current IP Address."
	read _IpAddr
	echo "You entered your androids IP Address as "$_IpAddr""
	echo "Is your IP address correct? y/n "
	read yn
	if [ "$yn" = "y" ];
		then 
			echo "Now going to download your photos and albums from your android device to your local machines Pictures folder."
			sleep 3
			wget -r -l 3 ftp://"$_IpAddr":3721/DCIM/
			break
	fi
done

##############################################################

cd ~/Pictures

##############################################################

# Here we ask the user if they have a local server that they want
# to copy their photos onto from their local machine

while true; do
	echo "Do you want to copy your photos from you local machine to your local server? y/n " 
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
						echo "Now going to secure copy your photos to your local server location."
						scp -r "$_NewFile" "$_SvrAddr"
						echo "All done."
						break
				fi
			done
			break;;
		[Nn]* ) echo "All done."
			exit;;
		* ) echo "Please answer with (y) for yes or (n) for no."
	esac
done

##############################################################

exit 



