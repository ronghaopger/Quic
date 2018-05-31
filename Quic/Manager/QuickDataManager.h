//
//  QuickDataManager.h
//  Quic
//
//  Created by didi on 2018/5/25.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuickDataManager : NSObject
+ (instancetype)sharedManger;
@property (nonatomic, strong) NSDictionary *contentDictionary;
@end
