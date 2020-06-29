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


