#!/bin/sh

if [[ -z "${APP_PATH}" ]];
then
	echo "The environment variable APP_PATH is not defined. It's necessary to continue the installation.... aborting"
	exit 1
fi

if [ ! -d ${APP_PATH}/includes/config/settings.php ];
then
	echo "Initial setup..."
	cp -ar /usr/src/teampass/app/* ${APP_PATH}/
	mkdir -p /usr/local/teampass/sk/
	chown -Rf www-data:www-data ${APP_PATH}
	chown -Rf www-data:www-data /usr/local/teampass
fi

if [ -f ${APP_PATH}/includes/config/settings.php ] ;
then
	echo "Teampass is ready."
	rm -rf ${APP_PATH}/install
else
	echo "Teampass is not configured yet. Open it in a web browser to run the install process."
	echo "Use ${APP_PATH}/sk for the absolute path of your saltkey."
	echo "When setup is complete, restart this image to remove the install directory."
fi

# inicia o precosso php-fpm
echo "starting php-fpm process...."
php-fpm

# Pass off to the image's script
#exec /start.sh