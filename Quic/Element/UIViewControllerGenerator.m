//
//  UIViewControllerGenerator.m
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UIViewControllerGenerator.h"
#import "Utils.h"

@implementation UIViewControllerGenerator
+ (void)generateWithContext:(NSMutableArray<NSString*>*)context {
    //location
    NSArray *boundaryArray = [Utils locationClassBodyWithContext:[context copy]];
    NSInteger startLine = [boundaryArray[0] integerValue];
    NSInteger endLine = [boundaryArray[1] integerValue];
    //search
    NSString *className = [Utils searchClassNameWithLine:context[startLine]];
    //delete old class body
    [context removeObjectsInRange:NSMakeRange(startLine, endLine - startLine + 1)];
    //insert new class body
    [context addObject:[NSString stringWithFormat:@"@implementation %@", className]];
    [context addObjectsFromArray:[Utils readTemplateFileWithFileName:@"InitViewControllerFile.strings"]];
    [context addObject:@"@end"];
}
@end
