//
//  SourceEditorCommand.m
//  Quic
//
//  Created by didi on 2018/5/24.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "SourceEditorCommand.h"
#import <AppKit/NSWorkspace.h>
#import "QuickDataManager.h"
//Element
#import "UIViewGenerator.h"
#import "UIViewControllerGenerator.h"

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    NSMutableArray<NSString*> *context = invocation.buffer.lines;
    if ([invocation.commandIdentifier isEqualToString:@"hulk.Quic.initViewAdvanced"]) {
        [[NSWorkspace sharedWorkspace] launchApplication:@"QuicAPP.app"];
    }
    else if ([invocation.commandIdentifier isEqualToString:@"hulk.Quic.initView"]) {
        [UIViewGenerator generateWithContext:context];
        if ([QuickDataManager sharedManger].contentDictionary) {
            [UIViewGenerator generateAdvancedWithContext:context];
            //reset
            [QuickDataManager sharedManger].contentDictionary = nil;
        }
    }
    else if ([invocation.commandIdentifier isEqualToString:@"hulk.Quic.initViewController"]) {
        [UIViewControllerGenerator generateWithContext:context];
    }
    
    completionHandler(nil);
}

@end
