
#!/bin/bash  
#Time Laps (1s / 2h) -> 120 images  
#60 seconds (1000 milliseconds) for 1 hours (3600000 milliseconds) resulting 3600
DATE=$(date +"%Y-%m-%d_%H%M")  
  
  
  
raspistill -o "/home/pi/camera/rpicam_%04d.jpg" -tl 1000 -t 7200000

