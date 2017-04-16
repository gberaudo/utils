> videos.html
for i in *.MTS *.mp4;
do
  out="mini_$i.mp4"
  ffmpeg -i $i -c:v libx264 -preset slow -crf 22 -vf scale=iw/2:-1 -r 25 -ac 2 -strict -2 -c:a aac $out
  echo '<video width="960" height="540" controls><source src="'$out'">Your browser does not support the video tag.</video>' >> videos.html
done
