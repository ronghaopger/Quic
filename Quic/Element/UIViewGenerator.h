//
//  UIViewGenerator.h
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewGenerator : NSObject
+ (void)generateWithContext:(NSMutableArray<NSString*>*)context;
+ (void)generateAdvancedWithContext:(NSMutableArray<NSString*>*)context;
@end
