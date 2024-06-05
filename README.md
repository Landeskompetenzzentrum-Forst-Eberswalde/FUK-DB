# FUK-DB

[![Docker Compose Actions Workflow](https://github.com/Thuenen-Forest-Ecosystems/TFM-postgres-docker/actions/workflows/test.yml/badge.svg)](https://github.com/Thuenen-Forest-Ecosystems/TFM-postgres-docker/actions/workflows/test.yml)

## Getting Started

## 1. Download & Install Docker Desktop

https://docs.docker.com/desktop/install/ubuntu/

## 2. clone repository
!! To clone the repo AND submodules use the ```--recursive``` flag !!
```
git clone https://github.com/Landeskompetenzzentrum-Forst-Eberswalde/FUK-DB.git
```

## 3. Change credentials
**Copy** the ```_.env``` file to ```.env``` and change the credentials for production.

## 4. Run

```bash
docker compose up --build
```
<sub>To run docker in background mode add ```-d```</sub>

**Potgrest**
http://localhost:3000/

**Swagger**
http://localhost:4080/

**PgAdmin**
http://localhost:5050/pgadmin/


## 5. Stop & Remove

```bash
docker compose down --volumes
```


## Setup pgAdmin
Add a connection to postGres by register a new Server. Add Host name (```PGADMIN_HOST_NAME```), username (```POSTGRES_USER```) and password (```POSTGRES_PASSWORD```) defined in your ```.env``` file.