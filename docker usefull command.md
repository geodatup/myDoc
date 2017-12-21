
Docker 
=======

 

effacer toutes les images

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker rmi -f $(docker images -q)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


arrête et supprime tous les containers
~~~
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) 
~~~