

Creer un fichier backup_cron.sh avec ce code
placer le dans /var/www/production/ann/

```#! /bin/sh

# Backup des données du site d'Ann
#
# Les fichiers sont stockés sur un stockage externe
# Le script nécéssite d'acceder à l'environnement virtuel myven


PATH_APP=/var/www/production/ann
PATH_BKP=/media/store/backup/
PATH_LOG=/var/log/

workon myven

echo ---------------------------------- >> PATH_LOG/ann_backup.log
echo `date` >> PATH_LOG/backup.log
echo Demarrage du backup >> PATH_LOG/ann_backup.log


$PATH_APP/python manage.py dumpdata -o $PATH_BKP/dumpdata.json
sudo cp -R $PATH_APP/media/ PATH_BKP/ann
```

# Lancer le régulièrement avec une tache crontab 


```crontab -e
```
Ajouter  
```
*/5 * * * * /var/www/production/ann/backup_cron.sh
```
