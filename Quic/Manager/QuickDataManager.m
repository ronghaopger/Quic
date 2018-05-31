//
//  QuickDataManager.m
//  Quic
//
//  Created by didi on 2018/5/25.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import "QuickDataManager.h"

@implementation QuickDataManager
+ (instancetype)sharedManger {
    static QuickDataManager *manager = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[QuickDataManager alloc] init];
        }
    });
    return manager;
}
@end
