Step by step guide to setup xdebug:

 Install Chrome Extension Languages & Frameworks / PHP / Debug
    https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc
 
 Enable xdebug extension in app container
 
    docker exec -it powwow_app_1 bash
    docker-php-ext-enable xdebug
 
 For CLI debugging set env variables
 
    export PHP_IDE_CONFIG="serverName=zed"
    export XDEBUG_CONFIG="remote_port=9009 remote_autostart=1"
    
 Configure PHPStorm debugging to port 9009 and listen to all incomming connections + break on first line.
 If its not working, [enable xdebug logging](../init.d/local-php.ini).
