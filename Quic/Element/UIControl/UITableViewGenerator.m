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
+ (void)generateWithContext:(NSMutableArray<NSString *> *)context {
    [super generateWithContext:context];
    
    //location class extension
    NSArray<NSNumber*> *boundaryOfClassExtension = [Utils locationClassExtensionWithContext:[context copy]];
    NSInteger startLineOfClassExtension = [boundaryOfClassExtension[0] integerValue];
    context[startLineOfClassExtension] = [context[startLineOfClassExtension] stringByReplacingOccurrencesOfString:@"()" withString:@"() <UITableViewDataSource,UITableViewDelegate>"];
    //location delegate
    NSInteger delegateIndex = [Utils locationDelegatePragmaMarkWithContext:[context copy]];
    //insert delegate
    NSMutableArray<NSString*> *delegateContentArray = [[Utils readTemplateFileWithFileName:[self delegateTemplateFileName]] mutableCopy];
    [context insertObjects:[delegateContentArray copy] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(delegateIndex + 1, delegateContentArray.count)]];
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
