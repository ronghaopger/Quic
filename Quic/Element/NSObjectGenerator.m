//
//  NSObjectGenerator.m
//  Quic
//
//  Created by didi on 2018/12/20.
//  Copyright © 2018 hulk. All rights reserved.
//

#import "NSObjectGenerator.h"
#import "Utils.h"

@implementation NSObjectGenerator
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
    [context addObjectsFromArray:[Utils readTemplateFileWithFileName:@"InitObjectFile.strings"]];
    [context addObject:@"@end"];
}
@end
