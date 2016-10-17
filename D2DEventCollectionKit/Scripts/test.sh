#!/bin/sh

echo "Testing..."

xcodebuild test D2DEventCollectionKit/D2DEventCollectionKit.xcproject -scheme D2DEventCollectionKitTests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.0' ONLY_ACTIVE_ARCH=YES | xcpretty -t; exit ${PIPESTATUS[0]}
