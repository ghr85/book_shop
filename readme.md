# Villous

Villous is a web based app designed to make the monthly ordering of NHS Scotland Gluten Free prescription products simpler
and more convenient.

## Description

Villous was conceived as a solution after noting that pharmacies who offered monthly prescriptions of gluten free products
to those suffering from coeliac disease were still taking pen and paper orders and using a local hard copy i.e. print out
of both the order form and the catalogue to choose products from, this was then input to a computer manually. Every month
this involves the patient sitting at the cashier desk and navigating through leaves of paper - some of he items upon which
were crossed out depending on availability.

A web based app which can be accessed on desktop/smartphone would allow patients to create orders with ease and items which were
unavailable would simply be omitted from display until such time as they were available. The idea would be then that these
orders can be printed out or pdf emailed to the pharmacy - alternatively if the NHS had an API then Villous would aim to post
patient's orders directly to that API.

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