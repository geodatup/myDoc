
#!/bin/bash  
# exposure off - awb Suny - raw image

DATE=$(date +"%Y-%m-%d_%H%M")  

raspistill --exposure off --awb sun --raw -o /home/pi/camera/no-exp_Sun_$DATE.raw.jpg