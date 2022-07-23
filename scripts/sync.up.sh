source ./scripts/parse.site.sh
echo $cid
#docker exec -i $cid /bin/sh < ./scripts/dev.configs.sh
cd configs
SYNCSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
cd ../
tar -cf syncup.tar configs/
docker cp syncup.tar $cid:/var/www/syncup.tar
docker exec -i $cid /bin/sh < ./scripts/sync.configs.sh

echo $SYNCSHA