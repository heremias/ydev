drush content_as_config:export-all
cd /var/www/drupal/web/sites/default/files
tar -zcf dev.content.tar.gz content
mv dev.content.tar /var/www