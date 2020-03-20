#import "AutostartPlugin.h"
#if __has_include(<autostart/autostart-Swift.h>)
#import <autostart/autostart-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "autostart-Swift.h"
#endif

@implementation AutostartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAutostartPlugin registerWithRegistrar:registrar];
}
@end
