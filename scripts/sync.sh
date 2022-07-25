
source ./scripts/parse.site.sh
echo $cid $tag
#rm -rf sync

tar -cf $cid.$tags.bak.tar configs
rm -rf configs
tar -xf $cid.$tag.tar
mv sync configs
#cd ~/ydev/sync
#SyncSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
#echo "checksum: "$SyncSHA

cd configs
ConfSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
echo "checksum: "$ConfSHA

#cd ~/ydev

#mv configs $tag-configs


#mv sync configs

#cd configs
#NewSHA=$(find . -type f -exec shasum {} + | LC_ALL=C sort | shasum)
#echo "checksum: "$NewSHA
