cd /var/www/drupal
drush cex -y
drush content_as_config:export-all 
cd /var/www/drupal/web/sites/default/files/config*
tar cf dev.configs.tar sync
mv dev.configs.tar /var/www
cd /var/www/drupal/web/sites/default/files
tar cf dev.content.tar sync
mv dev.content.tar /var/www