# BenchTimer

1. [BenchTimer]()
2. [BenchTimer Optimized]()


# 1. [BenchTimer]()

```objective-c
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BenchTimer : NSObject

+ (CFTimeInterval)measureBlock:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
```

```objective-c
#import "BenchTimer.h"
#import <QuartzCore/QuartzCore.h>

@implementation BenchTimer

+ (CFTimeInterval)measureBlock:(void (^)(void))block
{
    NSUInteger runCount = 10;
    NSMutableArray *executionTimes = [[NSMutableArray alloc] init];
    for (NSUInteger index = 0; index < runCount; index++) {
        CFTimeInterval startTime = CACurrentMediaTime();
        block();
        CFTimeInterval endTime = CACurrentMediaTime();
        CFTimeInterval executionTime = endTime - startTime;
        NSNumber *nsNumberExecutionTime = [NSNumber numberWithDouble:executionTime];
        [executionTimes insertObject:nsNumberExecutionTime atIndex:index];
    }
    CFTimeInterval sum = 0.0;
    for (NSUInteger index = 0; index < runCount; index++) {
        sum += [executionTimes[index] doubleValue];
    }
    CFTimeInterval averageExecutionTime = sum / (CFTimeInterval)(runCount);
    return averageExecutionTime;
}
@end
```

```objective-c
#import <Foundation/Foundation.h>
#import "BenchTimer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double value = [BenchTimer measureBlock:^{
            NSLog(@"hello");
        }];
        NSLog(@"execution time: %G", value);
    }
    return 0;
}
```


# 2. [BenchTimer Optimized]()

Sum each execution time calculation inside each iteration:

```objective-c
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
```

```console
2020-06-29 16:18:18.452372-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.453441-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.453537-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.453623-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.453821-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.453891-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.453967-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.454034-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.454177-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.454240-0500 BenchTimer_ObjectiveC[25961:771902] hello
2020-06-29 16:18:18.454321-0500 BenchTimer_ObjectiveC[25961:771902] execution time: 0.000455569
Program ended with exit code: 0
```
