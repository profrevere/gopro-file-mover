#!/bin/bash
#Rsync Automation script for pulling new files off GoPro Hero 7 MicroSD card and into new folder by date.
currentDate='date +”%F”'

#User Input Prompts
echo -e "What type of activities were recorded? (e.g. Yoga, Nightlapse)"
read activity
echo "Confirming the activity type is $activity."
echo -e "What type of files are we transfering? (e.g. Videos or Pictures)"
read fileType
echo "Confirming that only $fileType's will be transfered."

#Pre-defined variables
SOURCEDIR=/media/$USER/GoPro7/DCIM/*GOPRO/

#Directory Creation
if [ $fileType = "Videos" ]
then
	mkdir -p ~/Videos/$activity/$currentDate/
	cd ~/Videos/$activity/$currentDate/
	rsync -avhtP --exclude-from="gopro-file-offload-Videos-exclude-list.txt" $SOURCEDIR ~/Videos/$activity/$currentDate/ | tee ~/Videos/$activity/$currentDate/Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

if [ $fileType = "Pictures" ]
then
	mkdir -p ~/Pictures/$activity/$currentDate/
	cd ~/Pictures/$activity/$currentDate/
	rsync -avhtP --exclude-from="gopro-file-offload-Pictures-exclude-list.txt" $SOURCEDIR ~/Pictures/$activity/$currentDate/ | tee ~/Pictures/$activity/$currentDate/Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

#END




