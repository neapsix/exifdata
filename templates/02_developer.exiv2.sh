filename=$1

#----------------------------------------
# 1. DEVELOPER COMMENT
# Edit line 12 to add a different comment.
#----------------------------------------
exiv2 \
  -M "set Exif.Photo.UserComment Comment \
    $(exiv2 -g Exif.Photo.UserComment -Pv $filename \
      | cut -d$'\n' -f 1) <YOUR DEVELOPER OR PROCESS DETAILS>" \
$filename
