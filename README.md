
# remove your backups

1. Pull image from [docker hub](https://hub.docker.com/r/profteam/backup-remover)

`docker pull profteam/backup-remover`

2. Now you can use image

```
version: '3'
 
 services:
   backup_remover:
     image: profteam/backup-remover
     container_name: backup_remover
     environment:
      COUNT_FILES: 5 # it is count of files that we should leave in each sub folder inside folder /backups
     volumes:
       - /var/docker/mysql/backups/:/backups/mysql
       - /var/docker/mongo/backups/:/backups/mongo
       - /var/docker/backup_remover/logs:/var/log
     networks:
       - livenetwork
 networks:
   livenetwork:
     external: true
```

3. You can run following command for testing logrotate
```
docker exec -it backup_remover /usr/sbin/logrotate /etc/logrotate.conf
```
