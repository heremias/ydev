source ./scripts/parse.site.sh
echo $cid $tag
docker exec -i $cid /bin/sh < ./scripts/dev.configs.sh
docker cp $cid:/var/www/dev.configs.tar.gz $cid.$tag.tar.gz
#docker cp $cid:/var/www/dev.content.tar.gz $cid.$tag.content.tar.gz
tar -zxf $cid.$tag.tar.gz
rm -rf sync/.htaccess
cd sync
DEVSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
echo $DEVSHA