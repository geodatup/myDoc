~~~
git clone tata@github.com
Permission denied (publickey).
~~~

[](https://stackoverflow.com/questions/26505980/github-permission-denied-ssh-add-agent-has-no-identities/28444641#28444641)

~~~
sudo ssh-add -l
The agent has no identities.
~~~

~~~

ssh-keygen -t rsa -b 4096 -C “geodatup@gmail.com”
~~~

Generating public/private rsa key pair.
Enter file in which to save the key (/home/pirate/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/pirate/.ssh/id_rsa.
Your public key has been saved in /home/pirate/.ssh/id_rsa.pub.
The key fingerprint is:
xx:xx:xx:xx:xx “geodatup@gmail.com”
The key's randomart image is:
+---[RSA 2048]----+
|                 |
| .               |
|                 |
|                 |
|                 |
|                 |
|                 |
|          ?      |
|                 |
+-----------------+

ssh-add ~/.ssh/id_rsa
Identity added: /home/pirate/.ssh/id_rsa (/home/pirate/.ssh/id_rsa)

ssh-add -l
2048 83:ac:69:6d:bf:12:cf:3e:b4:e3:58:22:2f:63:39:be /home/pirate/.ssh/id_rsa (RSA)


