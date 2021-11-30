//
//  Utils.m
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "Utils.h"

@implementation Utils
#pragma mark - public method
+ (NSArray<NSNumber*>*)locationClassBodyWithContext:(NSArray<NSString*>*)context {
    NSInteger startLine = 0;
    for (; startLine < context.count; startLine++) {
        if ([context[startLine] containsString:@"@implementation "]) {
            break;
        }
    }
    NSInteger endLine = startLine;
    for (; endLine < context.count; endLine++) {
        if ([context[endLine] containsString:@"@end"]) {
            break;
        }
    }
    return @[[NSNumber numberWithInteger:startLine], [NSNumber numberWithInteger:endLine]];
}

+ (NSArray<NSNumber*>*)locationClassExtensionWithContext:(NSArray<NSString*>*)context {
    NSInteger startLine = 0;
    for (; startLine < context.count; startLine++) {
        if ([context[startLine] containsString:@"@interface "]) {
            break;
        }
    }
    if (startLine <=0 || startLine >= context.count) {
        return @[[NSNumber numberWithInteger:-1], [NSNumber numberWithInteger:-1]];
    }
    
    NSInteger endLine = startLine;
    for (; endLine < context.count; endLine++) {
        if ([context[endLine] containsString:@"@end"]) {
            return @[[NSNumber numberWithInteger:startLine], [NSNumber numberWithInteger:endLine]];;
            break;
        }
    }
    return @[[NSNumber numberWithInteger:-1], [NSNumber numberWithInteger:-1]];
}

+ (NSInteger)locationActionPragmaMarkWithContext:(NSArray<NSString*>*)context {
    NSInteger index = 0;
    for (; index < context.count; index++) {
        if ([context[index] containsString:@"#pragma mark - action"]) {
            return index;
        }
    }
    return -1;
}

+ (NSInteger)locationDelegatePragmaMarkWithContext:(NSArray<NSString*>*)context {
    NSInteger index = 0;
    for (; index < context.count; index++) {
        if ([context[index] containsString:@"#pragma mark - delegate"]) {
            return index;
        }
    }
    return -1;
}

+ (NSString*)searchClassNameWithLine:(NSString*)line {
    return [[line stringByReplacingOccurrencesOfString:@"@implementation " withString:@""] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSArray<NSString*>*)readTemplateFileWithFileName:(NSString*)fileName {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:[bundlePath stringByAppendingString:[NSString stringWithFormat:@"/Contents/Resources/%@", fileName]]];
    NSData *fileData = [fileHandle readDataToEndOfFile];
    NSString *fileContent = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    return [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}
@end
