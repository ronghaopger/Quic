//
//  UIViewControllerGenerator.m
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UIViewControllerGenerator.h"
#import "Utils.h"
#import "UIViewPropertyGenerator.h"
#import "OthersGenerator.h"
#import "UILabelGenerator.h"
#import "UIButtonGenerator.h"
#import "UIImageViewGenerator.h"
#import "UITableViewGenerator.h"

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
    [context addObjectsFromArray:[Utils readTemplateFileWithFileName:@"InitViewControllerFile"]];
    [context addObject:@"@end"];
}

+ (void)generateAdvancedWithContext:(NSMutableArray<NSString*>*)context {
    NSArray<NSNumber*> *boundaryOfClassExtension = [Utils locationClassExtensionWithContext:[context copy]];
    if (!boundaryOfClassExtension.count || boundaryOfClassExtension[0].integerValue < 0) {
        return;
    }
    //insert control
    [OthersGenerator generateWithContext:context];
    [UILabelGenerator generateWithContext:context];
    [UIViewPropertyGenerator generateWithContext:context];
    [UIButtonGenerator generateWithContext:context];
    [UIImageViewGenerator generateWithContext:context];
    [UITableViewGenerator generateWithContext:context];
}
@end
