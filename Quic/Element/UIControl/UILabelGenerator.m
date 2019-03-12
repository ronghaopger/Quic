//
//  UILabelGenerator.m
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UILabelGenerator.h"

@implementation UILabelGenerator
#pragma mark - protected method
+ (NSString *)controlClassName {
    return @"UILabel";
}

+ (NSString *)getterTemplateFileName {
    return @"InitLabelGetterFile.strings";
}
@end
