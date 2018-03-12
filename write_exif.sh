#!/bin/bash

# Applies scanner data and any other .exiv2 files
# that are in this directory to the target file.

# If you enter a date as the second argument, also
# enters that date and a time of 18:00 as the original capture time.

filename="$1"
document_name=$(basename "$filename" | cut -d'.' -f 1)
datetime=$(date -r $filename +"%Y:%m:%d %H:%M:%S")

# set scanner properties
exiv2 \
  -M "set Exif.Photo.DateTimeDigitized Ascii $datetime" \
  -M "set Exif.Image.DocumentName Ascii $document_name" \
  -M "set Exif.Photo.UserComment Comment Nikon LS-2000" \
  $filename



if [ $# -eq 2 ]; then
  # if you know the date taken, enter it in the format YYYY:MM:DD
  datetimeorig=$2

  exiv2 -M "set Exif.Photo.DateTimeOriginal Ascii $2 18:00:00" $filename
fi

# run the rest of my exiv2 templates in this directory
for f in *.exiv2; do
  exiv2 -m $f $filename
done

for f in *.exiv2.sh; do
  sh $f $filename
done

# to set fields without complex logic, create a .exiv2 file with a line like this one:
# set   Exif.Image.Make   Ascii   "PENTAX"

# to append to the user comment field, create a .exiv2.sh file with this script:
# filename=$1

# exiv2 \
#  -M "set Exif.Photo.UserComment Ascii \
#    $(exiv2 -g Exif.Photo.UserComment -Pv $filename \
#      | cut -d$'\n' -f 1) Kodak Tri-X 400" \
# $filename
