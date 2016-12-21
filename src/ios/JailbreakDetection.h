//
//  JailbreakDetection.h
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//

#import "Foundation/Foundation.h"
#import "Cordova/CDV.h"

@interface JailbreakDetection : CDVPlugin

- (void) detectJailbreak:(CDVInvokedUrlCommand*)command;

@end
