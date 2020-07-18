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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *smallArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
        NSString *formattedTime = [BenchTimer measureBlockWithFormattedTime:^{
            BOOL result = startsWithZero(smallArray);
        }];
    
        NSLog(@"Average startsWithZero() execution time for array with %lu elements is: %@", (unsigned long)[smallArray count], formattedTime);
    }
    return 0;
}

bool startsWithZero(NSArray *array)
{
    if ([array count] == 0) {
        return false;
    }
    NSNumber *integerNumber = [[NSNumber alloc] initWithInt:0];
    return [array objectAtIndex:0] == integerNumber ? true : false;
}


