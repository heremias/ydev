
#Get Container ID
source ./scripts/parse.site.sh
echo $cid $tag

#rm -rf sync

#Configs artifact with tag and cid
tar -zcf $cid.$tags.bak.tar.gz configs

#Flush configs
rm -rf configs

#Unpack and Copy new configs from sync to configs folder
tar -xf $cid.$tag.tar.gz
mv sync configs


#cd ~/ydev/sync
#SyncSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
#echo "checksum: "$SyncSHA

cd configs
#SHA Checksum for new configs
ConfSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)

#New configs checksum variable $ConfSHA
echo "checksum: "$ConfSHA

#cd ~/ydev

#mv configs $tag-configs


#mv sync configs

#cd configs
#NewSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
#echo "checksum: "$NewSHA
