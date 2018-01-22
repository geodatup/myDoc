
#!/bin/bash  
# exposure off - awb Shade - raw image

DATE=$(date +"%Y-%m-%d_%H%M")  

raspistill --exposure off --awb shade --raw -o /home/pi/camera/no-exp_shade_$DATE.raw.jpg