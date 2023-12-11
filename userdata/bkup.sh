#!/bin/sh
# Script to backup production database to JSON files.

source common.sh

echo ${UserCollections[@]}
for collection in ${UserCollections[@]}; do
    echo "Backing up $collection"
    $EXP --collection=$collection --db=$DB --out=$BKUP_DIR/$collection.json $URI
done

git add $BKUP_DIR/*.json
git add $BKUP_DIR/*.json
# git commit $BKUP_DIR/*.json -m "Mongo DB backup"
# git pull origin master
# git push origin master
