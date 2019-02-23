#!/bin/bash

# Image downloader by Ray Heffer, February 23 2019
# Blog: https://rayheffer.com
# GitHub: https://github.com/rayheffer/tpdne

# Configuration
max=5
url=https://www.thispersondoesnotexist.com/image
imgdir=images

printf 'Downloading '$max' images'
printf '\n'

# Loop to download images $max number of times
count=1
while [ $count -le $max ]
do
wget -q $url -P images/
printf '\r%2d Completed' $count
((count++))
done

# Create images directory if it doesn't exist
mkdir -p $imgdir
cd $imgdir

# Checks each file downloaded for file extension, to avoid overwriting existing images
for f in *; do
if [[ $f != *.jpg ]] # Checks each file for .jpg extension
then
mv $f `basename $f `.$$.jpg; # Adds process ID ($$) and .jpg extension (E.g. image.7232.jpg
fi
done;

# Complete!
printf '\n'
printf 'Downloads complete! All images saved to images/'
printf '\n'