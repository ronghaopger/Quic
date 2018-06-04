//
//  AppDelegate.m
//  QuicAPP
//
//  Created by didi on 2018/5/24.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "AppDelegate.h"
#import <AppKit/NSWorkspace.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *labelTextField;
@property (weak) IBOutlet NSTextField *buttonTextField;
@property (weak) IBOutlet NSTextField *imageTextField;
@property (weak) IBOutlet NSTextField *tableTextField;

- (IBAction)goAction:(id)sender;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)goAction:(id)sender {
    NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"UILabel"] = [_labelTextField stringValue];
    dictionary[@"UIButton"] = [_buttonTextField stringValue];
    dictionary[@"UIImageView"] = [_imageTextField stringValue];
    dictionary[@"UITableView"] = [_tableTextField stringValue];
    [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"QuickQDistributedNotification" object:bundleID userInfo:[dictionary copy]];
    exit(0);
}
@end
