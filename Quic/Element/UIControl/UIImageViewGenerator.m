//
//  UIImageViewGenerator.m
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "UIImageViewGenerator.h"
#import "QuickDataManager.h"
#import "Utils.h"

@implementation UIImageViewGenerator
#pragma mark - protected method
+ (NSString *)controlClassName {
    return @"UIImageView";
}

+ (NSString *)templateFileName {
    return @"InitImageViewGetterFile.strings";
}
@end
