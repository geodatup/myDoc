
#!/bin/bash  
# exposure off raw image

DATE=$(date +"%Y-%m-%d_%H%M")  

raspistill --exposure off --raw -o /home/pi/camera/no-exp_$DATE.raw.jpg