//
//  CDVPlugin+MyClass.h
//  HelloWorld
//
//  Created by NKO on 15/3/17.
//
//


#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface MyPlugin : CDVPlugin

@property (nonatomic, copy) NSString* callbackID;

// Instance Method
- (void) print:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end