source ./scripts/get.key.sh

#Set KEY equals the Account ID entered during setup
KEY=$1

#Get Branches from branches endpoint
curl -s "http://ymain.northcentralus.cloudapp.azure.com/branches" > branches.json

#Parse endpoint with Account ID KEY
cat branches.json | get_key $KEY