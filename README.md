# Boardable Coding Exercise

This repo is designed as a starting point to implement a "public meeting page" feature. A full description of the task and expected outcome is available in [ExerciseOverview.md](ExerciseOverview.md).

In order to run the application, you will need to:

1. Have an installed version of Laravel
2. Create a database (`touch database/database.sqlite`)
3. Run `php artisan migrate:install`
4. Run `php artisan migrate`
5. Run `php artisan db:seed`
6. Run your server (`php artisan serve` if not using Homestead or another virtualization technique)
7. Visit the application ( http://127.0.0.1:3000/meetings ) - you may need to adjust the port pending on how you serve the code
8. Log in with username: `test@boardable.com` and password: `password`

You can also setup the application environment via Docker from the following commands:

1. `docker build -t public-meeting-page .`
2. `docker run -p 3000:3000 -d public-meeting-page`
3. Visit the application ( http://127.0.0.1:3000/meetings )
4. Log in with username: `test@boardable.com` and password: `password` 

To access the Docker container via shell:
`docker exec -it <container id> /bin/bash`
