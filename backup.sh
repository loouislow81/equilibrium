#!/bin/bash
#
# @@script: backup.sh
# @@description: incremental backup init script
# @@author: Loouis Low
# @@copyright:
# @@license: MIT License
#

### constant
export USER="loouis"
export HOME="/media/loouis/Storage"
BACKUP_DIR="${HOME}/backup"
DEST_DIR="user-loouis"
MEDIUM="/media/loouis/Storage"
BACKUP_SOURCE="/home/loouis"
BACKUP_DESTINATION="${MEDIUM}/backup/usr-loouis"
BACKUP_SIZE="/dev/sda"
FLTR_FOLDER_1="Downloads"
FLTR_FOLDER_2="Musics"
FLTR_FOLDER_3="Videos"
FLTR_FOLDER_4="Pictures"
FLTR_FOLDER_5="log"
FLTR_FOLDER_5="Public"
LOG="/home/loouis/.log/backup.log"

##runas root
function root_only () {
   if [ "$(whoami &2>/dev/null)" != "root" ] && [ "$(id -un &2>/dev/null)" != "root" ]
      then
         echo "[backup] Permission denied."
         exit 1
   fi
}

### run equilibrium
function run_backup () {
   echo "[backup] started..."
   equilibrium ${BACKUP_SOURCE} ${BACKUP_DESTINATION}
   echo "[backup] done!"
}

### remove unwanted folders
function optimize_backup () {
   echo "[backup] optimizing backup..."

   find ${BACKUP_DIR}/{$DEST_DIR} -name ${FLTR_FOLDER_1} -type d -exec rm -r {} \;
   echo "[backup] FOLDER: Downloads removed!"

   find ${BACKUP_DIR}/{$DEST_DIR} -name ${FLTR_FOLDER_2} -type d -exec rm -r {} \;
   echo "[backup] FOLDER: Musics removed!"

   find ${BACKUP_DIR}/{$DEST_DIR} -name ${FLTR_FOLDER_3} -type d -exec rm -r {} \;
   echo "[backup] FOLDER: Videos removed!"

   find ${BACKUP_DIR}/{$DEST_DIR} -name ${FLTR_FOLDER_4} -type d -exec rm -r {} \;
   echo "[backup] FOLDER: Pictures removed!"

   find ${BACKUP_DIR}/{$DEST_DIR} -name ${FLTR_FOLDER_5} -type d -exec rm -r {} \;
   echo "[backup] FOLDER: log removed!"

   find ${BACKUP_DIR}/{$DEST_DIR} -name ${FLTR_FOLDER_6} -type d -exec rm -r {} \;
   echo "[backup] FOLDER: Public removed!"
}

### display total backup size
function show_backup_size () {
   echo "[backup] getting backup size..."
   df ${BACKUP_SIZE}
}

### write log
function write_log () {
   echo "[backup] sync finished at" `date` >> ${LOG}
}

### initialize
root_only
run_backup
optimize_backup
write_log
show_backup_size
