lancer le script depuis /bin/gunicorn_start

supprimer le dossier run en cas de problème de démarage
Avoir les droits d'écriture sur le dossier /var/www/ pour créer run/socket


#!/bin/bash

NAME="ann"                                  # Name of the application
DJANGODIR=/media/store/projets/www/ann             # Django project directory
SOCKFILE=/media/store/projets/www/ann/run/gunicorn.sock  # we will communicte using this unix socket
USER=pi                                        # the user to run as
GROUP=pi                                     # the group to run as
NUM_WORKERS=3                                     # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=ann.settings.production            # which settings file should Django use
DJANGO_WSGI_MODULE=ann.wsgi                     # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec /home/pi/.virtualenvs/myven/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --bind=unix:$SOCKFILE \
#  --bind=0.0.0.0:8000 \
