cd drupal
#drush one time login and formatting for $login
drush uli | sed '$!d' | sed -r -e 's!default!localhost:8081!g'
