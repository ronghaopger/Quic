//
//  UIControlGenerator.h
//  Quic
//
//  Created by didi on 2018/5/31.
//  Copyright © 2018年 hulk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIControlGenerator : NSObject
#pragma mark - public method
+ (void)generateWithContext:(NSMutableArray<NSString*>*)context;

#pragma mark - protected method
/*
 * 控件类型 比如"UILabel" "UIButton"..
 */
+ (NSString*)controlClassName;
/*
 * 是否要添加action
 */
+ (BOOL)needActionForControl;
/*
 * gettter模板文件名
 */
+ (NSString*)getterTemplateFileName;
/*
 * delegate模板文件名
 */
+ (NSString*)delegateTemplateFileName;
@end
