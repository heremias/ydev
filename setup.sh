source ./scripts/get.branches.sh
#git log -1 --pretty=%h > commit.txt
#tag=$(<commit.txt)
tag=$(source ./scripts/get.tag.sh)

echo $tag
echo "Number: "
read ynumber
#echo -n "Tag: $tagY Number: "
#read ynumber
sh ./scripts/get.branches.sh $ynumber
#cat branches.json | get_key $ynumber
docker image rm ylocal:latest
docker build -t ylocal:$tag .
docker tag ylocal:$tag ylocal:latest
docker run -d --name $ynumber-DEV -p 8081:80 ylocal:latest
cid=$(sh ./scripts/dev.get.cid.sh $ynumber)
echo "cid:$cid"
#sh ./dev.get.cid.sh $ynumber > vars/cid
#cid=$(<vars/cid)
#tar -xf configs.tar
uuid=$(sh ./scripts/dev.get.sync.sh $cid)
echo "uuid:$uuid"
#tar -xf configs.tar -C configs
#source ./scripts/dev.get.sync.sh
docker exec -i $cid /bin/sh < ./scripts/cex.sh
#sh ./scripts/dev.cex.sh $cid
#sid=$(sh ./scripts/dev.get.sid.sh $cid)
sid=$(docker exec -i $cid /bin/sh < ./scripts/get.uuid.sh)
echo "sid:$sid"

#sh cex $cid
#sh scripts/dev.get.sid.sh $cid
#sed -in .sid 4p system.site.yml >> ../environments/stage/.env
cd configs
sed -i .bak "4s/$uuid/$sid/" system.site.yml
cd -
tar cf sync.tar configs
docker cp sync.tar $cid:/var/www/sync.tar

docker exec $cid /bin/sh -c "/var/www/scripts/sync.sh"
#echo "ynumber:$ynumber cid:$cid uuid:$uuid "
echo "tag:$tag ynumber:$ynumber cid:$cid uuid:$uuid sid:$sid"