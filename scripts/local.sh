#!/bin/bash


BACKUP_DIRECTORY="$(dirname $(dirname -- "$0";))/backup"

if [ ! -d "$BACKUP_DIRECTORY" ]; then
    mkdir "$BACKUP_DIRECTORY"
fi

pushd "$BACKUP_DIRECTORY"
    rsync -avP "$INST_MC_DIR/saves/Backup/" "${BACKUP_DIRECTORY}/$(date -Idate)"
    git add "$BACKUP_DIRECTORY"
    git commit -m ":floppy_disk: BACKUP: Backup for $(date -Idate)"
    git push origin main
popd

echo "Backed up successfully!"
