//
//  UIViewPropertyGenerator.m
//  Quic
//
//  Created by didi on 2019/1/24.
//  Copyright © 2019 hulk. All rights reserved.
//

#import "UIViewPropertyGenerator.h"

@implementation UIViewPropertyGenerator
#pragma mark - protected method
+ (NSString *)controlClassName {
    return @"UIView";
}

+ (NSString *)getterTemplateFileName {
    return @"InitViewGetterFile";
}
@end
