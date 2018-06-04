//
//  Utils.h
//  Quic
//
//  Created by didi on 2018/5/29.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
/*
 * 定位类的实体部分
 */
+ (NSArray<NSNumber*>*)locationClassBodyWithContext:(NSArray<NSString*>*)context;
/*
 * 定位类的扩展部分
 */
+ (NSArray<NSNumber*>*)locationClassExtensionWithContext:(NSArray<NSString*>*)context;
/*
 * 定位 #pragma mark - action
 */
+ (NSInteger)locationActionPragmaMarkWithContext:(NSArray<NSString*>*)context;
/*
 * 定位 #pragma mark - delegate
 */
+ (NSInteger)locationDelegatePragmaMarkWithContext:(NSArray<NSString*>*)context;
/*
 * 查找类名
 */
+ (NSString*)searchClassNameWithLine:(NSString*)line;
/*
 * 读取模板文件
 */
+ (NSArray<NSString*>*)readTemplateFileWithFileName:(NSString*)fileName;
@end
