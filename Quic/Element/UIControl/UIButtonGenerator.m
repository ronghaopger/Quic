//
//  UIButtonGenerator.m
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UIButtonGenerator.h"
#import "QuickDataManager.h"
#import "Utils.h"

@implementation UIButtonGenerator
#pragma mark - protected method
+ (NSString *)controlClassName {
    return @"UIButton";
}

+ (BOOL)needActionForControl {
    return YES;
}

+ (NSString *)getterTemplateFileName {
    return @"InitButtonGetterFile.strings";
}
@end
