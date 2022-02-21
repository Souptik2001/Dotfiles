# Docker Based complete WordPress setup -

Three containers will be running together to complete this setup -

### WordPress docker container requirements -
- PHP.
- PHP fpm (Bridge b/w web server and PHP).
- Web Server.
- WordPress codebase.
- WP-CLI.
- MYSQL client (For migration operations of WP-CLI).

### MySQL docker container requirements -
- Mysql server and client (client is optional).

### PHPMyAdmin docker container requirements -
- PHPMyAdmin.

___

### Pre-requisites -
- Docker and docker-compose installed.

___

### Two step easy setup process😃 -
- Change the path of written in the line `32` of `docker-compose.yml` file to a local folder absolute path where you want to store your WordPress data persistently.
- Run `docker-compose up -d` from the folder where you have the `docker-compose.yml` file.

___

#### Data persistency -
Your complete WordPress codebase and database data will be preserved.
- The WordPress codebase will be present the in the folder you mentioned in the section above.
- To check where the database information is stored run `docker volume ls` and there you will find a volume with a name ending with `wordpress_db_data`. Now run `docker volume inspect <volume_name>` to find out the information about the volume. There the path of the volume will also be written.

___

To enter into any of the container you can run - `docker exec -it <container_name> bash`.

Once you enter into the WordPress container you will be able to run wp-cli commands with just `wp`, from anywhere in the filesystem!