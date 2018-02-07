SOLR tomcat

#install solr with solr-tomcat (for tomcat6 only)

sudo apt-get -y install openjdk-7-jdk
sudo mkdir /usr/java
sudo ln -s /usr/lib/jvm/java-7-openjdk-amd64 /usr/java/default


sudo apt-get install libtomcat6-java tomcat6-common tomcat6 tomcat6-admin solr-tomcat
sudo apt-get install solr-tomcat
try http://localhost:8080/solr

#Create directories to hold SOLR cores (just one, in our case, called ckan):

mkdir -p /usr/share/solr/ckan /var/lib/solr/data/ckan /etc/solr/ckan


sudo /etc/init.d/tomcat6 restart



#install solr from source (available for tomcat 7)
####
#sudo apt-get install libtomcat6-java tomcat6-common tomcat6 tomcat6-admin
#cd /opt
#sudo wget http://archive.apache.org/dist/lucene/solr/4.7.2/solr-4.7.2.tgz
#tar -xvf solr-4.7.2.tgz
#cp -R solr-4.7.2/example /opt/solr
#cd /opt/solr
#java -jar start.jar

Copy Solr library files

Next we want to add the library files to Tomcat library directory. Note: You can also use symlinks if you prefer, but for the purpose of understand where everything goes I chose to place it directly in the directories

cp ~/solr-4.x.x/example/lib/ext/* /usr/share/tomcat7/lib/

It may be a good idea to also copy the java libraries from solr/dist/solrrj-lib/*

cp ~/solr-4.x.x/dist/solrj-lib/* /usr/local/tomcat7/lib/

Copy Solr WAR app file

cp ~/solr-4.x.x/dist/solr-4.x.x.war /var/lib/tomcat7/webapps/solr.war

Setup Drupal ApacheSolr core

    We first need to copy over the sample configuration files from ApacheSolr.

    mkdir -p /var/lib/tomcat7/solr
    cp -r ~/solr-4.x.x/example/solr/collection1/conf /var/lib/tomcat7/solr/

    Next grab the latest version of the apachesolr module https://drupal.org/project/apachesolr and unzip it

    tar xvf apachesolr-*.tar.gz

    Syncronize the apachesolr configuration files (for Drupal) with your solr configuration

    rsync -av apachesolr/solr-conf/solr-4.x/ /var/lib/tomcat7/solr/conf/

Note: I found an error in which ApacheSolr refused to start due to duplicate errors. I reported that here so you might want to look at the solution here as at the time of writing this I could not get it running without that!

    Create a core definition file to tell Apache Solr which cores are available.

    nano /var/lib/tomcat7/solr/solr.xml

    Paste the following code inside that file

    <?xml version="1.0" encoding="UTF-8" ?>
     <solr persistent="false">
       <cores adminPath="/admin/cores">
         <core name="!!yourcorename!!" instanceDir="!!yourcoredir!!" />
        </cores>
      </solr>

Create Drupal core directory

This will create a new core in your system with that name. If you wish to add more you simply can repeat this step as well as the one above.

mkdir /var/lib/tomcat7/solr/!!yourcoredir!!
cp -r /var/lib/tomcat7/solr/conf /var/lib/tomcat7/solr/!!yourcoredir!!/

Let's Make It Live

    Your at the last stretch!! Let's put tomcat7 to sleep

    service tomcat7 stop

    Now change the permissions on the tomcat directory

    chown -R tomcat7:tomcat7 /var/lib/tomcat7

    Start it back up

    service tomcat7 start

It's Live

You should be able to go to http://localhost:8983/solr and see a new core instance available! Now you can go ahead and configure drupal to point to that.

Note: Your new core is located at http://localhost:8983/solr/!!yourcorename!! to be used in the Drupal ApacheSolr module.