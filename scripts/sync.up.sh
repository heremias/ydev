# Get Container ID
source ./scripts/parse.site.sh
echo $cid

#docker exec -i $cid /bin/sh < ./scripts/dev.configs.sh

cd configs
#Generate SHA Checksum of config files
SYNCSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)

cd ../
# Copy configs to container $cid
tar -zcf sync.$cid.tar.gz configs/
docker cp sync.$cid.tar.gz $cid:/var/www/sync.$cid.tar.gz

# Pass into container sync configs script
docker exec -i $cid /bin/sh < ./scripts/sync.configs.sh

#Variable for checksum $SYNCSHA
echo $SYNCSHA