 

#!/bin/bash
#Time Laps (1m / 2h) -> 120 images
#60 seconds (60000 milliseconds) for 2 hours (7200000 milliseconds) resulting in a sequence of 120 images.
DATE=$(date +"%Y-%m-%d_%H%M")

raspistill -o /home/pi/camera/rpicam_%04d.jpg -tl 60000 -t 7200000