# Cloudlog Docker

## Get started

### Set up

### Build

```bash
$ ./build.sh
```

### Configure

```
$ docker-compose up -d
$ docker-compose exec mariadb bash

# mysql -u root -p

> CREATE DATABASE cloudlog;
> CREATE USER 'cloudlog'@'%' IDENTIFIED BY 'cloudlog00';
> GRANT ALL PRIVILEGES ON cloudlog.* TO 'cloudlog'@'%';
> QUIT;

# ^D

$ docker-compose down
```

### Run

```bash
$ docker-compose up
```
