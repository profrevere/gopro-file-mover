#!/bin/bash
#Rsync Automation script for pulling new files off GoPro Hero 7 MicroSD card and into new folder by date.

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
	mkdir ~/$fileType/$activity/$currentDate/
	touch ~/$fileType/$activity/$currentDate/Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

if [ $fileType = Pictures ]
then
	mkdir ~/$fileType/$activity/$currentDate/
	touch ~/$fileType/$activity/$currentDate/Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

#Pre-defined variables
SOURCEDIR=/media/$USER/GoPro7/DCIM/*GOPRO/
currentDate='date +”%d-%b-%Y”'
VIDDESTDIR=~/$fileType/$activity/$currentDate/
PICDESTDIR=~/$fileType/$activity/$currentDate/


#If/then statements for routing files
if [ $fileType = Videos ]
then
	rsync -avhtP --exclude="*.JPG" --exclude="*.THM" $SOURCEDIR $VIDDESTDIR > $VIDDESTDIR/Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

if [ $fileType = Pictures ]
then
	rsync -avhtP --exclude="*.MP4" --exclude="*.THM" $SOURCEDIR $PICDESTDIR > $PICDESTDIR/Rsync-Automation-Transfer-Log-$activity-$currentDate.txt
fi

#END




