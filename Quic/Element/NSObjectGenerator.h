//
//  NSObjectGenerator.h
//  Quic
//
//  Created by didi on 2018/12/20.
//  Copyright © 2018 hulk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObjectGenerator : NSObject
+ (void)generateWithContext:(NSMutableArray<NSString*>*)context;
@end

NS_ASSUME_NONNULL_END
