# osTicket
A simple, open source ticketing system available as a package on many Synology DiskStations.

## Purpose
The Synology DiskStation DS212j that was running osTicket for Trident Communications is nearing the end of its
venerable career (RIP buddy, you had a good run from 2012-2024) and as such, osTicket needed to be migrated to
a new host. Rather than hack it to pieces and move it to a newer DiskStation, I decided to containerize the app
so it can be run anywhere that docker can be run, orchestrated by docker-compose.

This repo contains several components.
- /src
  - A fork of an old osTicket v1.6 ST originally released circa 2010. It was originally modified to suit the
    the needs of the business by PJ Wilt around 2014, then further modified to obfuscate secrets and work in an
    orchestrated container setup by PJ Wilt in early 2024.
    - Features added:
      - Ticket work order print functionality
      - Additional fields required by business needs
      - Some other small tweaks to get it running in a containerized setup
- /nginx-conf
  - Nginx default site configuration
- /db_setup
  - Schema setup files (no data included)
- docker-compose.yml
  - A docker-compose configuration to mount secrets, volumes, and run the necessary containers

## Container Architecture
There are three containers that `docker-compose up` will start.
- mariadb
  - MariaDB database that stores the osTicket's configuration and data
  - Uses `mariadb:5.5` image (full MariaDB version is `5.5.64`)
  - Mounts `db_root_password.txt` as a secret which will set the root password of the database
    - Make sure there are no line breaks in your file :)
  - Mounts `mdb_data` as a volume so that your data persists after restart
  - Exposes the MySQL default port `3306` for connectivity
- php
  - PHP container that launches a PHP server with its root set at the staff interface of osTicket (the client
    interface is not exposed.) The PHP server listens on port `80`
  - Uses `php:5.6-fpm-alpine` image (full PHP version is `5.6.40`)
  - Mounts `db_root_password.txt` as a secret which will set the root password of the database
  - Mounts `attach_data` as a volume where attachments will be stored so that they persist after restart
  - Exposes port `8081` which is bound to the container's port `80`
- nginx
  - NGINX container that functions as a reverse proxy to allow for easy https. Manages certificates via certbot
    and autorenews certs as needed.
  - Uses `nginx:1.25.3-alpine3.18`, the latest NGINX alpine image that was available when I containerized this app
  - Mounts `certs` as a volume to persist the letsencrypt configuration/certificates
  - Exposes ports `80` and `443` so that certbot can do its thing and we can ensure redirect from 80 -> 443

## DB Schema
This was dumped out of the original osTicket DB that was running on MariaDB 5.5 on an old Synology DiskStation. No
data is included, just schema, and I make no warranty as to its usage. You could probably find/install an old copy
of osTicket v1.6 ST to get the original configuration data populated, run mysqldump on the database that's created,
then alter your schema based on a diff of that dump vs /db_setup/ost_dump.sql to get it up and running, but I leave
that as an exercise for the reader.

## Pull Requests
I mean... it's open source under GPLv2 but this is pretty purpose built for Trident, so I probably won't be
merging any pull requests :)

Feel free to fork it and tinker to your hearts content.

## License
The osTicket application is licensed under GPLv2 (license located at `/LICENSE` as well as `/src/license.txt`),
which means that if you want to use any of this codebase for your own application you must adhere to its copyleft
requirements. You may want to consider reading [this blog post](https://fossa.com/blog/open-source-software-licenses-101-gpl-v2/)
before doing so to get the cliffnotes on what all that entails.

## Author
PJ Wilt

Contact: p.wilt.jr@gmail.com
