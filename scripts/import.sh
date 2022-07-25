#Unpack configs 
tar -xf sync.*.tar.gz
cd configs
rm -rf system.site.yml

cd drupal
#Drush Config Import
drush cim --partial --diff --source=/var/www/configs

#Clear Cache
drush  cr

#Update DB
drush updatedb -y