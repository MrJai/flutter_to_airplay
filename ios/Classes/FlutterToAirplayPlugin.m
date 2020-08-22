#import "FlutterToAirplayPlugin.h"
#if __has_include(<flutter_to_airplay/flutter_to_airplay-Swift.h>)
#import <flutter_to_airplay/flutter_to_airplay-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_to_airplay-Swift.h"
#endif

@implementation FlutterToAirplayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterToAirplayPlugin registerWithRegistrar:registrar];
}
@end
