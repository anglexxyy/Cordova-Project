#import "Echo.h"
#import "ViewController.h"

@implementation Echo
- (void)echo:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    
    if (echo != nil && [echo length] > 0) {
        NSLog(@"ios received %@",echo);
        NSLog(@"ios send OK");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        NSLog(@"ios send fail");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
//    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
//    [self.commandDelegate runInBackground:^{
        ViewController* controller = [[ViewController alloc] init];
        [self.viewController showViewController:controller sender:self];
//    }];
    NSLog(@"xxxxx");
    
}
- (void)echo1:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    
    if (echo != nil && [echo length] > 0) {
        NSLog(@"ios received %@",echo);
        NSLog(@"ios send OK");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        NSLog(@"ios send fail");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end