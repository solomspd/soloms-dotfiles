#!/bin/sh
rsync -avhP /data/Solom/Solom/Anime /data/Ancalagon/Ancalagon/Anime tank.lan::tank/media &&
rsync -avhP /data/Abdo/Abdo/Abdos\ University\ work tank.lan::tank && 
rsync -avhP /data/Abdo/Abdo/images tank.lan::tank &
rsync -avhP /data/Abdo/Abdo/music tank.lan::tank/media &&
rsync -avhP /data/Abdo/Abdo/TV\ shows /data/Solom/Solom/TV\ shows /data/Ancalagon/Ancalagon/TV\ shows tank.lan::tank/media
