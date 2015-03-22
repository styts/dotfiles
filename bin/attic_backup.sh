#!/bin/sh

# backup avscoins
rsync -az wf:webapps/avscoins_media/originals/ /var/avscoins/media
rsync -az wf:db_backups/avscoins-$(date +%Y%m%d).dump /var/avscoins/db.dump

########################
# backup attic
########################

REPOSITORY=/backups

attic create --stats                            \
    $REPOSITORY::$(hostname)-`date +%Y-%m-%d`   \
    /home                                       \
    /etc                                        \
    /var/avscoins                               \
    --exclude /home/*/.cache                    \
    --exclude $HOME/Music                       \
    --exclude $HOME/Downloads                   \
    --exclude '*.pyc'                           

attic prune -v $REPOSITORY --keep-daily=7 --keep-weekly=4 --keep-monthly=6
