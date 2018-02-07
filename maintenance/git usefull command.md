
~\Documents\Projets> cd .\OSGeoLive-doc
~\Documents\Projets\OSGeoLive-doc [master ≡]> git checkout savemaster
Switched to branch 'savemaster'
~\Documents\Projets\OSGeoLive-doc [savemaster]> git branch -D master
Deleted branch master (was 48813166).
~\Documents\Projets\OSGeoLive-doc [savemaster]> git remote -v
OSGeo   https://github.com/OSGeo/OSGeoLive-doc.git (fetch)
OSGeo   https://github.com/OSGeo/OSGeoLive-doc.git (push)
origin  https://github.com/geodatup/OSGeoLive-doc.git (fetch)
origin  https://github.com/geodatup/OSGeoLive-doc.git (push)
~\Documents\Projets\OSGeoLive-doc [savemaster]> git pull OSGeo master
From https://github.com/OSGeo/OSGeoLive-doc
 * branch              master     -> FETCH_HEAD
Updating 48813166..83e6e511
Fast-forward
 README.txt => README.rst                       |  17 +++++++++++------
 de/overview/overview.rst                       |  23 ++---------------------
 en/contact.rst                                 |   4 +---
 en/Démarage rapide/gdal_Démarage rapide.rst              |  22 +++++++++++++++++-----
 images/screenshots/1024x768/osm-screenshot.jpg | Bin 187582 -> 238166 bytes
 5 files changed, 31 insertions(+), 35 deletions(-)
 rename README.txt => README.rst (59%)
~\Documents\Projets\OSGeoLive-doc [savemaster]> git checkout -b master OSGeo/master
Branch master set up to track remote branch master from OSGeo.
Switched to a new branch 'master'
~\Documents\Projets\OSGeoLive-doc [master ≡]> git push --force origin master
Counting objects: 38, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (38/38), done.
Writing objects: 100% (38/38), 235.41 KiB | 0 bytes/s, done.
Total 38 (delta 23), reused 0 (delta 0)
remote: Resolving deltas: 100% (23/23), completed with 11 local objects.
To https://github.com/geodatup/OSGeoLive-doc.git
   48813166..83e6e511  master -> master
~\Documents\Projets\OSGeoLive-doc [master ≡]>

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


