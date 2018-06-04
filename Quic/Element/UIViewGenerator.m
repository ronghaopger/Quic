//
//  UIViewGenerator.m
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UIViewGenerator.h"
#import "Utils.h"
#import "QuickDataManager.h"
#import "UILabelGenerator.h"
#import "UIButtonGenerator.h"
#import "UIImageViewGenerator.h"
#import "UITableViewGenerator.h"

@implementation UIViewGenerator
+ (void)generateWithContext:(NSMutableArray<NSString*>*)context {
    //location
    NSArray *boundaryArray = [Utils locationClassBodyWithContext:[context copy]];
    NSInteger startLine = [boundaryArray[0] integerValue];
    NSInteger endLine = [boundaryArray[1] integerValue];
    //search
    NSString *className = [Utils searchClassNameWithLine:context[startLine]];
    //delete old class body
    [context removeObjectsInRange:NSMakeRange(startLine, endLine - startLine + 1)];
    //insert class extension
    [context insertObject:@"\n" atIndex:startLine];
    [context insertObject:@"@end" atIndex:startLine];
    [context insertObject:@"\n" atIndex:startLine];
    [context insertObject:[NSString stringWithFormat:@"@interface %@()", className] atIndex:startLine];
    //insert new class body
    [context addObject:[NSString stringWithFormat:@"@implementation %@", className]];
    [context addObjectsFromArray:[Utils readTemplateFileWithFileName:@"InitViewFile.strings"]];
    [context addObject:@"@end"];
}

+ (void)generateAdvancedWithContext:(NSMutableArray<NSString*>*)context {
    NSArray<NSNumber*> *boundaryOfClassExtension = [Utils locationClassExtensionWithContext:[context copy]];
    if (!boundaryOfClassExtension.count || boundaryOfClassExtension[0].integerValue < 0) {
        return;
    }
    //insert control
    [UILabelGenerator generateWithContext:context];
    [UIButtonGenerator generateWithContext:context];
    [UIImageViewGenerator generateWithContext:context];
    [UITableViewGenerator generateWithContext:context];
}
@end
