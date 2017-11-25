#/bin/bash -e

input=$*
: ${input:=*.MTS *.mp4 *.MP4}
for i in $input;
do
  out="mini_`basename $i| sed 's/\.mp4$//I'`.mp4"
  ffprobe -show_streams -select_streams v -hide_banner $i 2>/dev/null| grep r_frame_rate | grep '50/1' && RATIO="-r 25"
  echo ffmpeg -i $i -c:v libx264 -preset slow -crf 22 -vf scale=iw/2:-1 $RATIO -ac 2 -strict -2 -c:a aac $out
done
