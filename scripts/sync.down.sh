source ./scripts/parse.site.sh
echo $cid $tag
docker exec -i $cid /bin/sh < ./scripts/dev.configs.sh
docker cp $cid:/var/www/dev.configs.tar $cid.$tag.tar
docker cp $cid:/var/www/dev.content.tar $cid.$tag.content.tar
tar -xf $cid.$tag.tar
rm -rf sync/.htaccess
cd sync
DEVSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
echo $DEVSHA