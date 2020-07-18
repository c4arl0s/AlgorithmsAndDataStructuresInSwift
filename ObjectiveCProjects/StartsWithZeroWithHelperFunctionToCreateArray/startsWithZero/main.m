//
//  main.m
//  startsWithZero
//
//  Created by Carlos Santiago Cruz on 18/07/20.
//  Copyright © 2020 Carlos Santiago Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BenchTimer.h"

bool startsWithZero(NSArray *array);
NSMutableArray *createArrayWithNumberOfElements(int numberOfElements, int valueOfEachElement);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *smallArray = createArrayWithNumberOfElements(3,0);
        NSString *formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(smallArray);
            (void)result;
        }];
        NSLog(@"Average execution time: %@, numberOfElements %lu for startsWithZero() array", formattedTime, (unsigned long)[smallArray count]);
        
        NSMutableArray *mediumArray = createArrayWithNumberOfElements(100000,0);
        formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(mediumArray);
            (void)result;
        }];
        NSLog(@"Average execution time: %@, numberOfElements %lu for startsWithZero() array", formattedTime, (unsigned long)[mediumArray count]);
        
        NSMutableArray *hugeArray = createArrayWithNumberOfElements(1000000,0);
        formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(hugeArray);
            (void)result;
        }];
        NSLog(@"Average execution time: %@, numberOfElements %lu for startsWithZero() array", formattedTime, (unsigned long)[hugeArray count]);
    }

    return 0;
}

bool startsWithZero(NSArray *array)
{
    if ([array count] == 0) {
        return false;
    }
    NSNumber *integerNumber = [[NSNumber alloc] initWithInt:0];
    return [array objectAtIndex:0] == integerNumber ? true : false; // I used firstObject, its exeution time is longer.
}

NSMutableArray *createArrayWithNumberOfElements(int numberOfElements, int valueOfEachElement)
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int index=0; index<numberOfElements; index++) {
        [array insertObject:[NSNumber numberWithInt:valueOfEachElement] atIndex:index];
    }
    return array;
}

