#!/bin/bash
set -ex

cd ant-on-mobile/platforms/android/ant-build
cordova build --release android
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ant.keystore Ant-release-unsigned.apk ant
rm -rf Ant-release-signed.apk
zipalign -v 4 Ant-release-unsigned.apk Ant-release-signed.apk

echo "Make sure you have incremented the version number or Google Play Store will reject it"
