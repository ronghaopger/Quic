//
//  UIControlGenerator.m
//  Quic
//
//  Created by didi on 2018/5/31.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UIControlGenerator.h"
#import "QuickDataManager.h"
#import "Utils.h"

@implementation UIControlGenerator
+ (void)generateWithContext:(NSMutableArray<NSString*>*)context {
    if (![self controlClassName].length || ![self getterTemplateFileName].length) {
        return;
    }
    //parse settings
    NSDictionary<NSString*,NSString*> *contentDictionary = [QuickDataManager sharedManger].contentDictionary;
    NSArray<NSString*> *controlArray = [contentDictionary[[self controlClassName]] componentsSeparatedByString:@","];
    if (!controlArray.count) {
        return;
    }
    for (NSString *controlName in controlArray) {
        //location class extension
        NSArray<NSNumber*> *boundaryOfClassExtension = [Utils locationClassExtensionWithContext:[context copy]];
        NSInteger endLineOfClassExtension = [boundaryOfClassExtension[1] integerValue];
        //insert property
        NSString *propertyText = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@%@;", [self controlClassName], controlName, [[self controlClassName] stringByReplacingOccurrencesOfString:@"UI" withString:@""]];
        [context insertObject:propertyText atIndex:endLineOfClassExtension - 1];
        if ([self needActionForControl]) {
            //location action
            NSInteger actionIndex = [Utils locationActionPragmaMarkWithContext:[context copy]];
            [context insertObject:@"}" atIndex:actionIndex + 1];
            [context insertObject:@"\n" atIndex:actionIndex + 1];
            [context insertObject:[NSString stringWithFormat:@"- (void)%@Action:(%@*)sender {", controlName, [self controlClassName]] atIndex:actionIndex + 1];
        }
        //location class body
        NSArray<NSNumber*> *boundaryOfClassBody = [Utils locationClassBodyWithContext:[context copy]];
        NSInteger endLineOfClassBody = [boundaryOfClassBody[1] integerValue];
        //insert getter
        NSMutableArray<NSString*> *getterContentArray = [[Utils readTemplateFileWithFileName:[self getterTemplateFileName]] mutableCopy];
        for (NSInteger i = 0; i < getterContentArray.count; i++) {
            getterContentArray[i] = [getterContentArray[i] stringByReplacingOccurrencesOfString:@"%@" withString:controlName];
        }
        [context insertObjects:[getterContentArray copy] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(endLineOfClassBody - 1, getterContentArray.count)]];
    }
}

#pragma mark - protected method
+ (NSString*)controlClassName {
    return nil;
}

+ (BOOL)needActionForControl {
    return NO;
}

+ (NSString*)getterTemplateFileName {
    return nil;
}

+ (NSString*)delegateTemplateFileName {
    return nil;
}
@end
