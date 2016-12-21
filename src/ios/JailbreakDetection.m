//
//  JailbreakDetection.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//  Techniques from http://highaltitudehacks.com/2013/12/17/ios-application-security-part-24-jailbreak-detection-and-evasion/
//

#import "Cordova/CDV.h"
#import "Cordova/CDVViewController.h"
#import "JailbreakDetection.h"

@implementation JailbreakDetection

- (void) detectJailbreak:(CDVInvokedUrlCommand*)command;
{
    CDVPluginResult *pluginResult;

    @try
    {
        NSString* jailbroken = [self jailbroken];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:jailbroken];
    }
    @catch (NSException *exception)
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.reason];
    }
    @finally
    {
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (NSString*) jailbroken {

#if !(TARGET_IPHONE_SIMULATOR)

    NSArray *paths = [NSArray arrayWithObjects:
                      @"/Applications/Cydia.app",
                      @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                      @"/bin/bash",
                      @"/usr/sbin/sshd",
                      @"/etc/apt",
                      nil];
    for (NSString *path in paths)
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            return [NSString stringWithFormat:@"existence of %@", path];
        }
    }

    NSError *error;
    NSString *testWriteText = @"Jailbreak test";
    NSString *testWritePath = @"/private/jailbreaktest.txt";

    [testWriteText writeToFile:testWritePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:testWritePath error:nil];

    if (error == nil)
    {
        return @"writable to /private";
    }

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]])
    {
        return @"can open url scheme cydia://";
    }

#endif

    return @"";
}

@end
