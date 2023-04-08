## Firefly setup on local environment

This is complete dockerized setup.

Steps to setup -
- Rename the `sample.env` file to `.env` file.
- On the last line of `.env` file add the value of `MAPBOX_API_KEY` if you want to use location services. You can get the API key from here - [Mapbox](https://account.mapbox.com/)
- Now you can just start the server by `docker compose up`. If you want to run it in background then use `docker compose up -d` to start it in detached mode.
- To stop it you can use `docker compose stop`.
- To start again you can use `docker compose start`.
- To remove the containers you can use `docker compose down`.
- To again build the containers you can again use `docker compose up` or `docker compose up -d`.
- Now you will have two volumes (one for DB and one for uploads).
- The two volumes will be present in the same directory inside `b2-backup` folder.
- I have used this folder structure because of my backup script architecture (using Duplicati). That way my data is always backed up and I can then again use it anywhere by just restoring those two volumes.
- You should also backup your volumes.
- To delete the volumes along with you containers you can use `docker compose down -v`. **This will not work in this case, because we have not used the volume, block in the docker-compose file. To delete the volume you can just delete the b2-backup folder.**
