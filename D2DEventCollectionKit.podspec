Pod::Spec.new do |s|
  s.name             = 'D2DEventCollectionKit'
  s.version          = '0.2.0'
  s.summary          = 'A dependency free iOS SDK for using the Door2Door mobility analytics.'
  s.homepage         = 'https://github.com/door2door-io/door2door-sdk-iOS'
  s.license 		 = 'MIT'
  s.author           = { 'Elmar Tampe' => 'elmar@door2door.io' }
  s.source           = { :git => 'https://github.com/door2door-io/door2door-sdk-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'D2DEventCollectionKit/Source/**/*'
end