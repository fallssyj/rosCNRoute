#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O CN.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=china-ip address=$net comment=CN"
done

} > ../CN.rsc


wget --no-check-certificate -c -O CNIPV6.txt https://ispip.clang.cn/all_cn_ipv6.txt

{
echo "/ip firewall address-list"

for net in $(cat CNIPV6.txt) ; do
  echo "add list=china-ip address=$net comment=CNIPV6"
done

} > ../CNIPV6.rsc


cd ..
rm -rf ./pbr
