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

#Directory Creation
if [ $fileType = Videos ]
then
	mkdir -p ~/Videos/$activity/date +”%F”/
fi

if [ $fileType = Pictures ]
then
	mkdir -p ~/$fileType/$activity/date +”%F”/
fi

#Pre-defined variables
SOURCEDIR=/media/$USER/GoPro7/DCIM/*GOPRO/
VIDDESTDIR=~/$fileType/$activity/$currentDate/
PICDESTDIR=~/$fileType/$activity/$currentDate/


#If/then statements for routing files
if [ $fileType = Videos ]
then
	rsync -avhtP --exclude="*.JPG" --exclude="*.THM" $SOURCEDIR $VIDDESTDIR | tee Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

if [ $fileType = Pictures ]
then
	rsync -avhtP --exclude="*.MP4" --exclude="*.THM" $SOURCEDIR $PICDESTDIR | tee Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

#END




