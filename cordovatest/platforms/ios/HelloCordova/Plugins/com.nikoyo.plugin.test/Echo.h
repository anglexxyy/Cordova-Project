//
//  CDVPlugin+Echo.h
//  HelloCordova
//
//  Created by NKO on 15/4/7.
//
//

#import <Cordova/CDVPlugin.h>

@interface Echo : CDVPlugin

- (void)echo:(CDVInvokedUrlCommand*)command;

@end
