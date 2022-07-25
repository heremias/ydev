cd /var/www/drupal
drush cex -y
cd /var/www/drupal/web/sites/default/files/config*
tar -zcf dev.configs.tar.gz sync
mv dev.configs.tar.gz /var/www