#!/bin/sh

echo "Testing..."

xcodebuild test D2DEventCollectionKit/D2DEventCollectionKit.xcproject -scheme D2DEventCollectionKitTests -sdk iphonesimulator10 -destination 'platform=iOS Simulator,name=iPhone 6,OS=10' ONLY_ACTIVE_ARCH=YES | xcpretty -t; exit ${PIPESTATUS[0]}
