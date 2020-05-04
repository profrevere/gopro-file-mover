#!/bin/bash
#Rsync Automation script for pulling new files off GoPro Hero 7 MicroSD card and into a new or existing folder by date.


#User Input Prompts
echo -e "What type of activities were recorded? (e.g. Yoga, Nightlapse)"
read activity
echo "Confirming the activity type is $activity."
echo -e "What type of files are we transfering? (e.g. Videos or Pictures)"
read fileType
echo "Confirming that only $fileType will be transfered."

#Pre-defined variables
SOURCEDIR=/media/$USER/GoPro7/DCIM/*GOPRO/

#Directory Creation
if [ $fileType == "Videos" ]
then
	mkdir -p ~/$fileType/$activity/$(date +%F)/
	rsync -avhtP --include='*/*.MP4' --exclude='*' $SOURCEDIR ~/Videos/$activity/$(date +%F)/ | tee ~/Videos/$activity/$(date +%F)/Rsync-Automation-Transfer-Log-$activity-$(date +%F).txt
fi

if [ $fileType == "Pictures" ]
then
	mkdir -p ~/$fileType/$activity/$(date +%F)/
	rsync -avhtP --include='*/*.JPG' --exclude='*' $SOURCEDIR ~/Pictures/$activity/$(date +%F)/ | tee ~/Pictures/$activity/$(date +%F)/Rsync-Automation-Transfer-Log-$activity-$(date +%F).txt
fi

#END




