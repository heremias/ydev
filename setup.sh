source ./scripts/get.branch.sh
clear

#Get current git commit
tag=$(source ./scripts/get.tag.sh)
echo "Current commit: "$tag

#Branch number input
echo "Site ID: "
read ynumber

# Create new setup Log
log_file="./logs/setup.log-`date +'%Y-%m-%d_%H-%M-%S'`"
[ -f "$log_file" ] || touch "$log_file"

echo "Setting Up yDev..."

#Get Branch
site=$(sh ./scripts/get.branch.sh $ynumber | sed -e 's/\"/''/g' | sed -e 's/},{/''/g' | sed -e 's/title:/''/g' | sed -e 's/,field_ynumber:*/''/g' | sed -e 's/[0-9]/''/g')
echo $site

#Start logging
exec 1>> $log_file 2>&1

#Build ylocal from YBase, tag with git commit tag and latest
docker image rm ylocal:latest
docker build -t ylocal:$tag .
docker tag ylocal:$tag ylocal:latest

#Run ylocal latest
docker run -d --name $ynumber-DEV -p 8081:80 ylocal:latest

#Get DEV container id
cid=$(sh ./scripts/dev.get.cid.sh $ynumber)
#echo "cid:$cid"

#Get UUID from sync configs
tar -xf sync.tar
uuid=$(sh ./scripts/dev.get.sync.sh $cid)
#echo "uuid:$uuid"

#Run drush config export on DEV
docker exec -i $cid /bin/sh < ./scripts/cex.sh

#Get UUID from DEV configs
sid=$(docker exec -i $cid /bin/sh < ./scripts/get.uuid.sh)
echo "sid:$sid"

#Update UUID in sync configs with DEV uuid
#cd configs
sed -i .bak "4s/$uuid/$sid/" ./configs/system.site.yml

#Compress sync configs
tar cf --disable-copyfile sync.tar configs

#Copy sync configs to DEV cinfigs
docker cp sync.tar $cid:/var/www/sync.tar

#docker exec $cid /bin/sh -c "/var/www/scripts/sync.sh"

#Return stdout from logging to terminal


#Write site.yml
echo "site: $site\n\nynumber: $ynumber\n\ntag: $tag\n\ncid: $cid\n\nuuid: $uuid\n\nsid: $sid" > site.yml
exec 1>&0
cat site.yml