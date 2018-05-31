//
//  SourceEditorExtension.m
//  Quic
//
//  Created by didi on 2018/5/24.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "SourceEditorExtension.h"
#import <AppKit/NSWorkspace.h>
#import "QuickDataManager.h"

@implementation SourceEditorExtension

- (void)extensionDidFinishLaunching
{
    [[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
    [[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(quickQAction:) name:@"QuickQDistributedNotification" object:nil];
}

- (void)quickQAction:(NSNotification*)notification {
    [QuickDataManager sharedManger].contentDictionary = notification.userInfo;
}

/*
 - (NSArray <NSDictionary <XCSourceEditorCommandDefinitionKey, id> *> *)commandDefinitions
 {
 // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
 return @[];
 }
 */

@end
