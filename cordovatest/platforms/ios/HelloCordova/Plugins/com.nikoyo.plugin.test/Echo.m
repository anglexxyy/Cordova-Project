//
//  CDVPlugin+Echo.m
//  HelloCordova
//
//  Created by NKO on 15/4/7.
//
//

#import "Echo.h"

@implementation Echo

- (void)echo:(CDVInvokedUrlCommand*)command
{
//    CDVPluginResult* pluginResult = nil;
//    NSString* echo = [command.arguments objectAtIndex:0];
//    
//    if (echo != nil && [echo length] > 0) {
//        NSLog(@"ios received %@",echo);
//        NSLog(@"ios send OK");
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
//    } else {
//        NSLog(@"ios send fail");
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
//    }
//    NSLog(@"xxxxx");
    
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"ImagesPreview" bundle:nil];
    [[self viewController ] presentViewController:secondStoryboard.instantiateInitialViewController animated:NO completion:nil];
    NSLog(@"SUCCESS!");
    
}

@end
