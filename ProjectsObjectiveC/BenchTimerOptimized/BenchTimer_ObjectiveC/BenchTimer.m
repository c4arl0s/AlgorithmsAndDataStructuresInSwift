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
@end
