filename=$1

#----------------------------------------
# 1. FILM COMMENT
# Edit line 12 to add a different comment.
#----------------------------------------
exiv2 \
  -M "set Exif.Photo.UserComment Ascii \
    $(exiv2 -g Exif.Photo.UserComment -Pv $filename \
      | cut -d$'\n' -f 1) <YOUR FILM TYPE>" \
$filename
