# exifdata
Adds exif data to images that don't have it, such as when scanning film.

## Usage:
1. Create copies of the templates and enter the artist, film, developer, and camera.
1. Put those files and a copy of the write-exif.sh script in the same directory as the images.
1. Run the script on each file, and optionally add the date digitized.

Warning: the scanner name is hard-coded in the script right now. It should be implemented as another template in a future revision. 

## Examples:
To write exif data to a single image using the templates in the same directory:

`$ write-exif.sh image.tif 2021:02:05`

To write exif data to all the TIFF images in the directory using the templates in the same directory:

`$ ls *.tif | xargs -n 1 -I{} ./write_exif.sh {} 2021:02:05`
