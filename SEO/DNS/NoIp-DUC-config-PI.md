NoIp DUC config


# Installer DUC


```
cd /usr/local/src
wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
tar xzf noip-duc-linux.tar.gz
cd no-ip-2.1.9
make
make install
```

To Configure the Client
As root again (or with sudo) issue the below command:
```
/usr/local/bin/noip2 -C
```


# Lancer le processus 
```
sudo /usr/local/bin/noip2
```

# Configurer le DUC au demarage du PI



# DOC ici
```
nano /usr/local/src/noip-2.1.9-1/README.FIRST
```