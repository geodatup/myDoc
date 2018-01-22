DATE=$(date +"%Y-%m-%d_%H%M")  

raspistill --exposure off -st --awb shade --raw -o /home/pi/camera/no-exp_shade_$DATE.raw.jpg

raspistill -st --raw -o /home/pi/camera/no-exp_shade_$DATE.raw.jpg


raspistill -t 0 -set --exposure off -st --raw --awb off -awbg 1.0,1.0 -ISO 100

raspistill -t 0 -set --exposure off --raw --awb off -awbg 1.0,1.0 -ISO 100

raspistill -vf -hf -t 0 -set --exposure off --shutter 60000 --raw --awb off -awbg 1.0,3.0 -ISO 100

raspistill -vf -hf -t 0 -set --exposure off --shutter 600000 --raw --awb off -awbg 1.0,1.0 -ISO 100

raspistill -vf -hf -t 0 -set --exposure off --shutter 1 --raw --awb off -awbg 1.0,1.0 -ISO 100
raspistill -vf -hf -t 0 -set --exposure off --shutter 1000 --raw --awb off -awbg 1.0,1.0 -ISO 100

raspistill -vf -hf -t 0 -set --exposure off --shutter 10000 --raw --awb off -awbg 1.0,1.0 -ISO 800

raspistill -vf -hf -t 0 -set --exposure off --shutter 60000 --raw --awb off -awbg 1.0,1.0 -ISO 100
raspistill -vf -hf -t 0 -set --exposure off --shutter 60000 --raw --awb off -awbg 1.0,1.0 -ISO 800