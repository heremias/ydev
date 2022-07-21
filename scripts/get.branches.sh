source ./scripts/get.key.sh
KEY=$1
curl -s "http://ymain.northcentralus.cloudapp.azure.com/branches" > branches.json
cat branches.json | get_key $KEY