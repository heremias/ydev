
#Parse json from Branches Endpoint and Get Branch title by Account ID
get_key () {
    KEY=$1
    sed 's/"title"/\n"title"/g' | grep -w $KEY | awk -F',' '{print $0}'
}