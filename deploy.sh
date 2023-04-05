#!/bin/bash
DAT3='0xba6f578786f2ca745814d72b6240781680d85c1204f2253cbf5ad07ec3ee52a0'
PROFILE="test1"
BASE=`pwd `
echo "dat3:' $DAT3'"
echo "aptos move compile -->  $DAT3_PATH --bytecode-version 6 "
echo `aptos move compile --save-metadata --package-dir  $DAT3_PATH --bytecode-version 6`
echo""
sleep 5
echo "aptos move publish --> $DAT3_PATH --bytecode-version 6 "
echo `aptos move publish --profile $PROFILE --assume-yes --package-dir  $DAT3_PATH --bytecode-version 6 `
echo""

sleep 3
echo " dat3_pool::init_pool "
echo `aptos move run --profile $PROFILE  --assume-yes --function-id $DAT3::dat3_pool::init_pool `
echo""
sleep 2
echo " dat3_pool_routel::init"
echo `aptos move run --profile $PROFILE  --assume-yes --function-id $DAT3::dat3_pool_routel::init`
echo""
sleep 2