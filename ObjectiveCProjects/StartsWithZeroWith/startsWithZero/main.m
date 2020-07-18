//
//  main.m
//  startsWithZero
//
//  Created by Carlos Santiago Cruz on 18/07/20.
//  Copyright © 2020 Carlos Santiago Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BenchTimer.h"
#import "NSMutableArray+CreateArrayWithNumberOfObjectsAndValue.h"

bool startsWithZero(NSArray *array);
NSMutableArray *createArrayWithNumberOfElements(int numberOfElements, int valueOfEachElement);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *smallArray = [[[NSMutableArray alloc] init] createArrayWithNumberOfElements:3 valueOfEachElement:1];
        NSString *formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(smallArray);
        }];
        NSLog(@"Average startsWithZero() execution time for array with %lu elements is: %@", (unsigned long)[smallArray count], formattedTime);
        
        NSMutableArray *mediumArray = [[[NSMutableArray alloc] init] createArrayWithNumberOfElements:10000 valueOfEachElement:1];
        formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(mediumArray);
        }];
        NSLog(@"Average startsWithZero() execution time for array with %lu elements is: %@", (unsigned long)[mediumArray count], formattedTime);
        
        NSMutableArray *hugeArray = [[[NSMutableArray alloc] init] createArrayWithNumberOfElements:1000000 valueOfEachElement:1];
        formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(hugeArray);
        }];
        NSLog(@"Average startsWithZero() execution time for array with %lu elements is: %@", (unsigned long)[hugeArray count], formattedTime);
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

