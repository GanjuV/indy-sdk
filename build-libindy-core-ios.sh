#!/bin/bash

if [ "$1" = "--help" ] ; then
  echo "Usage: $0 <key>"
fi

key="$1"

[ -z $key ] && exit 1

cat <<EOF | sftp -v -oStrictHostKeyChecking=no -i $key repo@192.168.11.111
rm /var/repository/repos/deb/pods-ios/libindy-core/0.1.1/libindy-core-ios.tar.gz
cd /var/repository/repos/deb/pods-ios/libindy-core/0.1.1
put /var/lib/jenkins/workspace/Sovrin_Client_Rust_PR-141-CUMLMK245MIVYNTDMX67EBWRBCOQKDPEA22J4KSMZHE6UQT6CNGA/libindy-core-ios.tar.gz
EOF