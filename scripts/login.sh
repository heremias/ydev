# Get Container ID
source ./scripts/parse.site.sh
echo $cid

#Pass Onetime login script to Drupal Container
login=$(docker exec -i $cid /bin/sh < ./scripts/onetime.sh)

#Pop open firefox on Mac and pass url
open -a firefox -g $login