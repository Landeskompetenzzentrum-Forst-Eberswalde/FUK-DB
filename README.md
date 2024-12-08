# FUK-DB

## Requirements

Cone Repository and install [docker and docker-compose](https://docs.docker.com/compose/install/).

## Installation

```bash
git clone https://github.com/Landeskompetenzzentrum-Forst-Eberswalde/FUK-DB.git fuk-db
git submodule update --init --recursive
cd fuk-db/FUC-ftp-server
cp .dev.local.env .env
npm install
cd ..
```
Change the .env file to your needs.

## Set Directories and Permissions

```bash
mkdir -p ~/.fuk-data && sudo chown -R 799:799 ~/.fuk-data
sudo chown -R "$USER"  ~/.fuk-data

mkdir -p ~/.fuk-logs && sudo chown -R 799:799 ~/.fuk-logs
sudo chown -R "$USER"  ~/.fuk-logs

mkdir -p ~/.fuk-backups && sudo chown -R 999:999 ~/.fuk-backups
sudo chown -R "$USER"  ~/.fuk-backups
```

## RUN

```bash
docker compose logs -f
```

After making changes to the docker-compose.yml file, you must restart the container.

```bash
docker compose up -d
```

## Open
```bash
http://localhost:8080
```

## Further Information
[Installing ThingsBoard using Docker (Linux or Mac OS)](https://thingsboard.io/docs/user-guide/install/docker/)

## Changes made to the original repository
Make PG available on port 5432 (https://github.com/thingsboard/thingsboard/issues/2285#issuecomment-1514054176)

## Backup

### pg_backups
The backups are created by the pgbackups docker service.

Backups are created daily at midnight and stored in the folder `~/.fuk-backups/`. Files are named like `thingsboard-20241207.sql.gz`.

Restore
```bash
docker exec -i [CONTAINER_ID] psql --username thingsboard -d thingsboard < ~/.fuk-backups/daily/[name].sql.gz
```

### Manually
Backup Database
```bash
sudo docker exec -i CONTAINER_ID pg_dump --username thingsboard -d thingsboard > ./backup/thingsboard.sql
```

Restore Database
```bash
docker exec -i [CONTAINER_ID] psql --username thingsboard -d thingsboard < ~/.fuk-backups/daily/[name].sql
```

### Backup in pgAdmin
Right click on the database -> Backup -> Format: Plain -> Filename: /var/lib/postgresql/data/backup.sql -> Dump