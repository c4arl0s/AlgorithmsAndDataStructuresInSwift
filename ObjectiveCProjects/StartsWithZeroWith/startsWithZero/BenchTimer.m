//
//  BenchTimer.m
//  BenchTimer_ObjectiveC
//
//  Created by Carlos Santiago Cruz on 29/06/20.
//  Copyright © 2020 Carlos Santiago Cruz. All rights reserved.
//

#import "BenchTimer.h"
#import <QuartzCore/QuartzCore.h>

@implementation BenchTimer

+ (CFTimeInterval)measureBlock:(void (^)(void))block
{
    NSUInteger runCount = 10;
    CFTimeInterval sum = 0.0;
    NSMutableArray *executionTimes = [[NSMutableArray alloc] init];
    for (NSUInteger index = 0; index < runCount; index++) {
        CFTimeInterval startTime = CACurrentMediaTime();
        block();
        CFTimeInterval endTime = CACurrentMediaTime();
        CFTimeInterval executionTime = endTime - startTime;
        sum += executionTime;
        NSNumber *nsNumberExecutionTime = [NSNumber numberWithDouble:executionTime];
        [executionTimes insertObject:nsNumberExecutionTime atIndex:index];
    }
    CFTimeInterval averageExecutionTime = sum / (CFTimeInterval)(runCount);
    return averageExecutionTime;
}

+ (NSString *)measureBlockWithFormattedTime:(void (^)(void))block
{
    NSUInteger runCount = 10;
    CFTimeInterval sum = 0.0    ;
    NSMutableArray *executionTimes = [[NSMutableArray alloc] init];
    for (NSUInteger index = 0; index < runCount; index++) {
        CFTimeInterval startTime = CACurrentMediaTime();
        block();
        CFTimeInterval endTime = CACurrentMediaTime();
        CFTimeInterval executionTime = endTime - startTime;
        sum += executionTime;
        NSNumber *nsNumberExecutionTime = [NSNumber numberWithDouble:executionTime];
        [executionTimes insertObject:nsNumberExecutionTime atIndex:index];
    }
    CFTimeInterval averageExecutionTime = sum / (CFTimeInterval)(runCount);

    NSString *formattedExecutionTime = [[NSString alloc] init];
    formattedExecutionTime = averageExecutionTime >= 1000 ? [NSString stringWithFormat:@"%.20lf [s]", averageExecutionTime] : averageExecutionTime >= 1 ? [NSString stringWithFormat:@"%.3g[s]", averageExecutionTime] : averageExecutionTime >= 1e-3 ? [NSString stringWithFormat:@"%.3g[ms]", averageExecutionTime*1e3] : averageExecutionTime >= 1e-6 ? [NSString stringWithFormat:@"%.3g[us]", averageExecutionTime*1e6] : averageExecutionTime < 1e-9 ? @"0  [s]" : [NSString stringWithFormat:@"%.3g[ns]", averageExecutionTime*1e9];
    return formattedExecutionTime;
}

@end
