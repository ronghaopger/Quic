//
//  UIViewControllerGenerator.h
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewControllerGenerator : NSObject
+ (void)generateWithContext:(NSMutableArray<NSString*>*)context;
@end