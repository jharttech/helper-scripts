Using the Andr-DL-tool


These steps are for using the Andr-DL-tool bash shell script.  Feel free to look through the code and adjust to your own needs.  This tutorial and script may be too advanced for some users and is intended to be used with a Unix based PC using the terminal.  I am in no way responsible for any errors, issues, or unexpected behavior from the use of this tutorial or any of the linked software.


This tutorial uses an FTP connection from your Android Device to your PC using a built in tool from ES File Explorer to download your photos and movies from your device.  Note: Only pictures and movies stored in your Android Devices DCIM folder will be downloaded to your PC.  This is the default location for most camera rolls or galleries on Android Devices at the time of this writing.


How to use Andr-DL-tool script to help speed up the process of copying pictures and movies from your android device to your local computer.  This is a bash script and works on unix based systems such as Linux or Mac. Instructions for ES File Explorer are written for Version 4.1.5.4 of the app.


Needed software:


    ES File Explorer installed on Android Device:  https://play.google.com/store/apps/details?id=com.estrongs.android.pop&hl=en


    Andr-DL-tool zip downloaded to your machine:  https://github.com/jharttech/helper-scripts/archive/master.zip




How To:


    1. Download and install the ES File Explorer APK, from Google Play Store, onto your Android Device.


    2. On your PC, download (or for advanced users Clone) and save the Andr-DL-tool zip file from github using the provided link above.  This will download the script as a zip file into your desired location.  


    3. Unzip the file using your preferred way to unzipping files. 


    4. Using your terminal, navigate to the unzipped “helper-scripts-master” file. For example (use your own path location in place of the example):
        $ cd /home/user/downloads/helper-scripts-master/
        Press Enter key


    5. Now, connect your android device to the same Wifi network or Local Network as your PC.  On most home networks this will allow both your PC and your Android to be on the same IP range, allowing them to communicate through the Andr-DL-tool script.


    6. (*NOTE: steps to create a FTP link on your Android Device may differ.) On your android, open the ES File Explorer app.  Tap the top left menu drop down.  Tap on the “Network” option.  Next, select the “Remote Manager” option.  Select the “Turn On” option.  If your Android is connected to your Wifi Connection then you should now see an address on your Device screen similar to this: “ftp://192.168.x.x:3721/“.  Write down the IP address between “//“ and “:3721” in this address.  In this case it would be “192.168.x.x”.


    7. On your PC, you should be in the “helper-scripts-master” directory at this point.  Simply type the following commands in your terminal:
        $ ./Andr-DL-tool.sh
        Press Enter key


    8. Follow the scripts prompts.  The first will ask for your Androids current IP address.  This is where the info you wrote down in step 6 is needed.  For example, you would simply type into the terminal “192.168.x.x”.  The script will ask you to verify if the IP address that you entered is correct, type “y” for yes and “n” for no, then press the Enter key.  This will establish a connection to your android device and will start the download process of your photos and movies and save them to your machines Pictures folder. If you do not have a picture folder the script will save the photos in a time stamped file in the same directory that you are running the script from.


    9.  After your photos and movies have been saved to your PC the script will ask if     you would like to copy the photos from your PC to a local unix server location.   For most users this will not be the case and you can simply type “n” for no, then press Enter key.  However, if you do want to you must have the ability to SSH into your local server and know the path to the location that you want to save to on your local server.  (*NOTE: I will not be going into the steps on how to     complete the transfer to a local server in this tutorial.)


    10. Once the script has completed its task remember to select “Turn off” on the ES File Explorer Remote Manage section on your Android Device to end the FTP connection on your PC. 




This script was created and written by JHart Technology.  It is offered for free and all code inside the script can be copied, transferred, used, or changed as needed by anyone.  


IN NO EVENT WILL WE BE LIABLE FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, INCIDENTAL, SPECIAL OR EXEMPLARY DAMAGES FOR ANY USE OF THIS SITE, OR USE OF ANY OTHER LINKED SITE, OR SOFTWARE, EVEN IF WE ARE ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
