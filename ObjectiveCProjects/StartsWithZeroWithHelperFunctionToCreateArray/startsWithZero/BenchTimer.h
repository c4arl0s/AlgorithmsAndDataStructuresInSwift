//
//  BenchTimer.h
//  BenchTimer_ObjectiveC
//
//  Created by Carlos Santiago Cruz on 29/06/20.
//  Copyright © 2020 Carlos Santiago Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BenchTimer : NSObject

+ (CFTimeInterval)measureBlock:(void (^)(void))block;
+ (NSString *)measureBlockWithFormattedTime:(void (^)(void))block;
@end

NS_ASSUME_NONNULL_END
