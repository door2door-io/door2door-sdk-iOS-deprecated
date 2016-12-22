#!/bin/sh

buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${SRCROOT}/Source/Supporting-Files/Info.plist")
buildNumber=$(($buildNumber + 1))
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "${SRCROOT}/Source/Supporting-Files/Info.plist"
