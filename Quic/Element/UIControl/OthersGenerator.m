//
//  OthersGenerator.m
//  Quic
//
//  Created by hulk on 2019/3/12.
//  Copyright © 2019 hulk. All rights reserved.
//

#import "OthersGenerator.h"

@implementation OthersGenerator
#pragma mark - protected method
+ (NSString *)controlClassName {
    return @"<#Class#>";
}

+ (BOOL)needNameSuffix {
    return NO;
}

+ (NSString *)getterTemplateFileName {
    return @"InitOthersGetterFile";
}
@end
