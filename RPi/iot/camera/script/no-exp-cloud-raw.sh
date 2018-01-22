
#!/bin/bash  
# exposure off - awb Cloudy - raw image

DATE=$(date +"%Y-%m-%d_%H%M")  

raspistill --exposure off --awb cloud --raw -o /home/pi/camera/no-exp_cloud_$DATE.raw.jpg