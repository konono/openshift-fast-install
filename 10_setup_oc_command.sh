#!/bin/bash
curl -LO https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
tar -xf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz -C ./ 2> /dev/null
cp -p openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/
cp -p openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/kubectl /usr/local/bin/

