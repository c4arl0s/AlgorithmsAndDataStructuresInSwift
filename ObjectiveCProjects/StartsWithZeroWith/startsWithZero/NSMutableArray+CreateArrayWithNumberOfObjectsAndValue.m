//
//  NSMutableArray+CreateArrayWithNumberOfObjectsAndValue.m
//  startsWithZero
//
//  Created by Carlos Santiago Cruz on 18/07/20.
//  Copyright © 2020 Carlos Santiago Cruz. All rights reserved.
//

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
