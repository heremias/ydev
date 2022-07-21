
cex () {
    CID=$1
    docker exec -i $CID /bin/sh < ~/ystart/scripts/cex.sh
}