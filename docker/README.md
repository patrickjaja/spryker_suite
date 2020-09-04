# Initial setup [Development]
By excuting the following steps you prepare the local development environment.
 - execute script `$ ./setup.sh`
 - Install spryker
    - `$ docker exec -it suite_app_1 bash`
    - `$ vendor/bin/install DE && chmod 777 -R data/ && chown 1000:1000 -R .`
    - `$ vendor/bin/console queue:worker:start -s`

# Initial setup [Testing]
By excuting this steps you create the environment for automized test execution.

 - Install spryker
    - `$ docker exec -it suite_app_1 bash`
    - `$ vendor/bin/install -r testing`

# Start/Stop/Uninstall Docker environment
## Linux
### Start env
    docker-compose start
### Stop env
    docker-compose stop
### Uninstall env
    docker-compose down -v    

***
For further documentation please check [docs](docs).
