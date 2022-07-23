tar -xf syncup.tar
cd drupal
drush cim --partial --diff --source=/var/www/configs
drush  cr
drush updatedb -y