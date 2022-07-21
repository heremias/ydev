source ./scripts/get.branch.sh
git log -1 --pretty=%h > commit.txt
tag=$(<commit.txt)
echo -n "Y Number: "
read ynumber
sh ./get.branches.sh $ynumber
#cat branches.json | get_key $ynumber
docker build -t ylocal:$tag .
docker tag ylocal:$tag ylocal:latest
docker run -d --name $ynumber-DEV -p 8081:80 ylocal:latest
cid=$(. ./dev.get.cid.sh $ynumber)
#sh ./dev.get.cid.sh $ynumber > vars/cid
#cid=$(<vars/cid)

tar -xf configs.tar -C configs
source ~/ystart/scripts/dev.get.sync.sh

sh ./scripts/dev.cex.sh $cid

source ~/ystart/scripts/dev.get.sid.sh $cid
sed -in .sid 4p system.site.yml >> ../environments/stage/.env
cd configs
rm -rf system.site.bak
rm -rf .DS_Store
tar cvf sync.tar configs
docker cp sync.tar $cid:/var/www/sync.tar
#docker exec $cid /bin/sh -c "/var/www/scripts/sync.sh"
echo $ynumber'\n'$cid'\n'$uuid'\n'
