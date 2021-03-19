# Book Shop

Book Shop is a web based app built whilst studying the book Build An API with Laravel (2019).

## Description



## Pre-requisites

* Docker CE

## Installation Instructions

1. Download or clone this repository.

2. Navigate to the directory of installation in terminal.

3. Copy the .env.example files to .env and populate with your local environement credentials, note that there is one for docker compose and one for Laravel.

```bash
cp example.env .env
```
and
```bash
cp src/example.env src/.env
```

4. Change the owner of the storage & cache directories so that the nginx web server can write to them.

```bash
sudo chgrp -R www-data storage bootstrap/cache
```
and
```bash
sudo chmod -R ug+rwx storage bootstrap/cache
```
5. Build the image and containers as specified in the docker compose file:

```bash
docker-compose up -d --build
```

6. Open an interactive terminal in the php container.

```bash
docker exec -it local_php /bin/sh
```

7. Install dependencies and bundle.

```bash
composer install
npm install
npm run dev
```

8. Navigate to {dockerhost}:8088 where you should find the app.

9. To run tests for a specific model
```bash
vendor/bin/phpunit --filter Distributor
```
