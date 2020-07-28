#!/bin/sh
rsync -av --delete /data/Solom/Solom/Anime /data/Ancalagon/Ancalagon/Anime /remote/Abdo-NAS/main &&
rsync -av --delete /data/Abdo/Abdo/Abdos\ University\ work /remote/Abdo-NAS/main && 
rsync -av --delete /data/Abdo/Abdo/images /remote/Abdo-NAS/main &&
rsync -av --delete /data/Abdo/Abdo/music /remote/Abdo-NAS/main &&
rsync -av --delete /data/Abdo/Abdo/TV\ shows /data/Solom/Solom/TV\ shows /data/Ancalagon/Ancalagon/TV\ shows /remote/Abdo-NAS/main
