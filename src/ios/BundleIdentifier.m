//
//  BundleIdentifier.m
//  Helper
//
//  Created by Calvin Lai on 7/17/13.
//
//

#import "BundleIdentifier.h"
#import <Cordova/CDVViewController.h>


@implementation BundleIdentifier

- (void)get:(CDVInvokedUrlCommand*)command {
    NSLog(@"get:%@", command.arguments);

    NSString *buildNumber = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString *bundleDisplayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    // NSString *bundleIconPath = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIconFile"]; // deprecated

    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionary];

    [resultDictionary setObject: buildNumber forKey: @"buildNumber"];
    [resultDictionary setObject: appVersion forKey: @"appVersion"];
    [resultDictionary setObject: bundleId forKey: @"bundleId"];
    [resultDictionary setObject: bundleDisplayName forKey: @"bundleDisplayName"];
    // [resultDictionary setObject: bundleIconPath forKey: @"bundleIconPath"];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: resultDictionary];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end

