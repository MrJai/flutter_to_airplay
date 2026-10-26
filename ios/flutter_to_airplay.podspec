#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_to_airplay.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_to_airplay'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin to play video via native AVPlayer and AirPlay it to Apple devices.'
  s.description      = <<-DESC
Flutter plugin that offers two widgets, one to play a video for a given url or file path using native AVPlayer and a second with an option to AirPlay it on available Apple devices.
                       DESC
  s.homepage         = 'https://github.com/MrJai/flutter_to_airplay'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Junaid Rehmat' => 'junaid.rehmat.rana@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_to_airplay/Sources/flutter_to_airplay/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
