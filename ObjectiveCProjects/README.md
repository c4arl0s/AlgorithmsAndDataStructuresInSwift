# BenchTimer

1. [BenchTimer](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#1-benchtimer)
2. [BenchTimer Optimized](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#2-benchtimer-optimized)
3. [BenchTimer Optimized with formatted time (with spaghuetti code](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#3-benchtimer-optimized-with-formatted-time-with-spaghuetti-code)
4. [BenchTimer Optimized with formatted time (using nested ternaries](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#4-benchtimer-optimized-with-formatted-time-using-nested-ternaries)


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

# 3. [BenchTimer Optimized with formatted time (with spaghuetti code)]()

In BenchTimer.m Suppress the executeTimes array because it is not needed

```objective-c
#import "BenchTimer.h"
#import <QuartzCore/QuartzCore.h>

@implementation BenchTimer

+ (CFTimeInterval)measureBlock:(void (^)(void))block
{
    NSUInteger runCount = 3;
    CFTimeInterval sum = 0.0;
    for (NSUInteger index = 0; index < runCount; index++) {
        CFTimeInterval startTime = CACurrentMediaTime();
        block();
        CFTimeInterval endTime = CACurrentMediaTime();
        CFTimeInterval executionTime = endTime - startTime;
        sum += executionTime;
    }
    CFTimeInterval averageExecutionTime = (sum / runCount);
    return averageExecutionTime;
}
@end
```

In main(), format the double value to print seconds, miliseconds, microseconds or nanosecods.

```objective-c
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double value = [BenchTimer measureBlock:^{
            NSLog(@"hello");
        }];
        NSString *formattedTime = [[NSString alloc] init];
        if (value >= 1000) {
            formattedTime = [NSString stringWithFormat:@"%.20lf [s]", value];
        } else if (value >= 1) {
            formattedTime = [NSString stringWithFormat:@"%.3g[s]", value];
        } else if (value >= 1e-3) {
            formattedTime = [NSString stringWithFormat:@"%.3g[ms]", value*1e3];
        } else if (value >= 1e-6) {
            formattedTime = [NSString stringWithFormat:@"%.3g[us]", value*1e6];
        } else if (value < 1e-9) {
            formattedTime = @"0 [s]";
        } else {
            formattedTime = [NSString stringWithFormat:@"%.3g[ns]", value*1e9];
        }
    
        NSLog(@"execution time: %@", formattedTime);
        
    }
    return 0;
}
```


```console
2020-07-02 17:48:13.265832-0500 BenchTimer_ObjectiveC[61345:2569805] execution time: 162us
Program ended with exit code: 0
```

# 4. [BenchTimer Optimized with formatted time (using nested ternaries)]()

Delete spaghetti code and replace it with nested ternaries.

before:

```objective-c
if (value >= 1000) {
    formattedTime = [NSString stringWithFormat:@"%.20lf [s]", value];
} else if (value >= 1) {
    formattedTime = [NSString stringWithFormat:@"%.3g[s]", value];
} else if (value >= 1e-3) {
    formattedTime = [NSString stringWithFormat:@"%.3g[ms]", value*1e3];
} else if (value >= 1e-6) {
    formattedTime = [NSString stringWithFormat:@"%.3g[us]", value*1e6];
} else if (value < 1e-9) {
    formattedTime = @"0 [s]";
} else {
    formattedTime = [NSString stringWithFormat:@"%.3g[ns]", value*1e9];
}
```


after:

```objective-c
formattedTime = value >= 1000 ? [NSString stringWithFormat:@"%.20lf [s]", value] : value >= 1 ? [NSString stringWithFormat:@"%.3g[s]", value] : value >= 1e-3 ? [NSString stringWithFormat:@"%.3g[ms]", value*1e3] : value >= 1e-6 ? [NSString stringWithFormat:@"%.3g[us]", value*1e6] : value < 1e-9 ? @"0  [s]" : [NSString stringWithFormat:@"%.3g[ns]", value*1e9];
NSLog(@"execution time: %@", formattedTime);
```

```console
2020-07-04 12:18:53.851927-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.852891-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853036-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853350-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853423-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853484-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853541-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853596-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853649-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853701-0500 BenchTimer_ObjectiveC[7443:288414] hello
2020-07-04 12:18:53.853879-0500 BenchTimer_ObjectiveC[7443:288414] execution time: 520[us]
Program ended with exit code: 0
```


