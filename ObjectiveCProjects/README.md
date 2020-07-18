# BenchTimer

1. [BenchTimer](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#1-benchtimer)
2. [BenchTimer Optimized](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#2-benchtimer-optimized)
3. [BenchTimer Optimized with formatted time (with spaghuetti code](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#3-benchtimer-optimized-with-formatted-time-with-spaghuetti-code)
4. [BenchTimer Optimized with formatted time (using nested ternaries](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ProjectsObjectiveC#4-benchtimer-optimized-with-formatted-time-using-nested-ternaries)
5. [startsWithZero function](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift/tree/master/ObjectiveCProjects#5-startswithzero-function)
6. [Create a Class method for BenchTimer to format time]()
7. [Create a helper function to create an array with specific number of elements and its value]()
9. [Create a Category for NSMutableArray called NSMutableArray+CreateArrayWithNumberOfObjectsAndValue]()

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


# 5. [startsWithZero function]()

In main.m import BenchTimer.h, then write a function

```objective-c
bool startsWithZero(NSArray *array)
{
    if ([array count] == 0) {
        return false;
    }
    NSNumber *integerNumber = [[NSNumber alloc] initWithInt:0];
    return [array objectAtIndex:0] == integerNumber ? true : false;
}
```

Inside main():

```objective-c
    NSArray *smallArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
    CFTimeInterval executionTime = [BenchTimer measureBlock:^{
        BOOL result = startsWithZero(smallArray);
    }];
    NSLog(@"Average startsWithZero() execution time for array with %lu elements is: %f", (unsigned long)[smallArray count], executionTime);
}
    return 0;
```

console:

```console
2020-07-18 07:30:18.676858-0500 startsWithZero[13657:620398] Average startsWithZero() execution time for array with 3 elements is: 0.000001
Program ended with exit code: 0
```

# 6. [Create a Class method for BenchTimer to format time]()

In BenchTimer.h

```objective-c
+ (NSString *)measureBlockWithFormattedTime:(void (^)(void))block;
```

In BenchTimer.m

```objective-c
+ (NSString *)measureBlockWithFormattedTime:(void (^)(void))block
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

    NSString *formattedExecutionTime = [[NSString alloc] init];
    formattedExecutionTime = averageExecutionTime >= 1000 ? [NSString stringWithFormat:@"%.20lf [s]", averageExecutionTime] : averageExecutionTime >= 1 ? [NSString stringWithFormat:@"%.3g[s]", averageExecutionTime] : averageExecutionTime >= 1e-3 ? [NSString stringWithFormat:@"%.3g[ms]", averageExecutionTime*1e3] : averageExecutionTime >= 1e-6 ? [NSString stringWithFormat:@"%.3g[us]", averageExecutionTime*1e6] : averageExecutionTime < 1e-9 ? @"0  [s]" : [NSString stringWithFormat:@"%.3g[ns]", averageExecutionTime*1e9];
    return formattedExecutionTime;
}
```

Then when you use BenchTimer class use the method in main.m

```objective-c
NSArray *smallArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
        NSString *formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(smallArray);
        }];
    
        NSLog(@"Average startsWithZero() execution time for array with %lu elements is: %@", (unsigned long)[smallArray count], formattedTime);
```

In console:

```console
2020-07-18 08:32:04.105499-0500 startsWithZero[14307:654719] Average startsWithZero() execution time for array with 3 elements is: 1.82[us]
Program ended with exit code: 0
```

# 7. [Create a helper function to create an array with specific number of elements and its value]()


Prototype function:

```objective-c
NSMutableArray *createArrayWithNumberOfElements(int numberOfElements, int valueOfEachElement);
```

definition:

```objective-c
NSMutableArray *createArrayWithNumberOfElements(int numberOfElements, int valueOfEachElement)
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int index=0; index<numberOfElements; index++) {
        [array insertObject:[NSNumber numberWithInt:valueOfEachElement] atIndex:index];
    }
    return array;
}
```

Call it in main


```objective-c
NSArray *smallArray = createArrayWithNumberOfElements(3,0);
NSMutableArray *mediumArray = createArrayWithNumberOfElements(100000,0);
NSMutableArray *hugeArray = createArrayWithNumberOfElements(1000000,0);
```

Build and run.

```console
2020-07-18 12:03:55.847387-0500 startsWithZero[16570:768643] Average execution time: 1.93[us], numberOfElements 3 for startsWithZero() array
2020-07-18 12:03:55.854143-0500 startsWithZero[16570:768643] Average execution time: 402[ns], numberOfElements 100000 for startsWithZero() array
2020-07-18 12:03:55.912104-0500 startsWithZero[16570:768643] Average execution time: 424[ns], numberOfElements 1000000 for startsWithZero() array
Program ended with exit code: 0
```

# 9. [Create a Category for NSMutableArray called NSMutableArray+CreateArrayWithNumberOfObjectsAndValue]()

In NSMutableArray+CreateArrayWithNumberOfObjectsAndValue.h

```objective-c
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (CreateArrayWithNumberOfObjectsAndValue)
- (NSMutableArray *)createArrayWithNumberOfElements:(int)numberOfElements valueOfEachElement:(int)valueOfEachElement;
@end

NS_ASSUME_NONNULL_END
```

In NSMutableArray+CreateArrayWithNumberOfObjectsAndValue.m

```objective-c
#import "NSMutableArray+CreateArrayWithNumberOfObjectsAndValue.h"

@implementation NSMutableArray (CreateArrayWithNumberOfObjectsAndValue)
- (NSMutableArray *)createArrayWithNumberOfElements:(int)numberOfElements valueOfEachElement:(int)valueOfEachElement
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int index=0; index<numberOfElements; index++) {
        [array insertObject:[NSNumber numberWithInt:valueOfEachElement] atIndex:index];
    }
    return array;
}
@end
```

In main.m

```objective-c
NSArray *smallArray = [[[NSMutableArray alloc] init] createArrayWithNumberOfElements:3 valueOfEachElement:1];
```

```objective-c
NSMutableArray *mediumArray = [[[NSMutableArray alloc] init] createArrayWithNumberOfElements:10000 valueOfEachElement:1];
```

```objective-c
NSMutableArray *hugeArray = [[[NSMutableArray alloc] init] createArrayWithNumberOfElements:1000000 valueOfEachElement:1];
```

```console
2020-07-18 12:05:13.649292-0500 startsWithZero[16605:770217] Average execution time: 1.25[us], numberOfElements 3 for startsWithZero() array
2020-07-18 12:05:13.656807-0500 startsWithZero[16605:770217] Average execution time: 480[ns], numberOfElements 100000 for startsWithZero() array
2020-07-18 12:05:13.709525-0500 startsWithZero[16605:770217] Average execution time: 333[ns], numberOfElements 1000000 for startsWithZero() array
Program ended with exit code: 0
```


