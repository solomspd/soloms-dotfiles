#!/bin/sh

nfs_loc='tank.lan'
rsync -avhP /mnt/Abdo/Abdo/Abdos\ University\ work "$nfs_loc"::tank && 
rsync -avhP /mnt/Abdo/Abdo/images "$nfs_loc"::tank
# rsync -avhP /mnt/Solom/Solom/Anime /data/Ancalagon/Ancalagon/Anime "$nfs_loc"::tank/media &&
# rsync -avhP /mnt/Abdo/Abdo/music "$nfs_loc"::tank/media &&
# rsync -avhP /mnt/Abdo/Abdo/TV\ shows /data/Solom/Solom/TV\ shows /data/Ancalagon/Ancalagon/TV\ shows "$nfs_loc"::tank/media
