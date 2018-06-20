//
//  UITableViewGenerator.m
//  Quic
//
//  Created by didi on 2018/6/4.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UITableViewGenerator.h"
#import "Utils.h"

@implementation UITableViewGenerator
#pragma mark - protected method
+ (BOOL)generateWithContext:(NSMutableArray<NSString *> *)context {
    BOOL canRun = [super generateWithContext:context];
    if (!canRun) {
        return NO;
    }
    //location class extension
    NSArray<NSNumber*> *boundaryOfClassExtension = [Utils locationClassExtensionWithContext:[context copy]];
    NSInteger startLineOfClassExtension = [boundaryOfClassExtension[0] integerValue];
    context[startLineOfClassExtension] = [context[startLineOfClassExtension] stringByReplacingOccurrencesOfString:@"()" withString:@"() <UITableViewDataSource,UITableViewDelegate>"];
    //location delegate
    NSInteger delegateIndex = [Utils locationDelegatePragmaMarkWithContext:[context copy]];
    //insert delegate
    NSMutableArray<NSString*> *delegateContentArray = [[Utils readTemplateFileWithFileName:[self delegateTemplateFileName]] mutableCopy];
    [context insertObjects:[delegateContentArray copy] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(delegateIndex + 1, delegateContentArray.count)]];
    return YES;
}

+ (NSString *)controlClassName {
    return @"UITableView";
}

+ (NSString *)getterTemplateFileName {
    return @"InitTableViewGetterFile.strings";
}

#pragma mark - private method
+ (NSString *)delegateTemplateFileName {
    return @"InitTableViewDelegateFile.strings";
}
@end
