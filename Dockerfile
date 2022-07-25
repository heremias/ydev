FROM ghcr.io/heremias/y-base-y-stage:latest

RUN chmod 777 -R /var/www/drupal/web/sites/default/files


COPY ./scripts/set.php.sh /var/www/
COPY ./scripts/load.sh /var/www/

RUN ./set.php.sh
RUN ./load.sh

#EXPOSE 80
