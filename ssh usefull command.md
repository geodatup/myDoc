ssh
====
connection depuis mac `ssh -l myusername nommachine`


## security
Effacer les key

`ssh-keygen -R 192.168.1.48`


##file trasnfering
get data from pi by scp (ssh copy)

~~~
scp pi@zeropi.local:test.jpg ./Desktop