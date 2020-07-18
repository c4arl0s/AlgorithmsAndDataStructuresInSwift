//
//  NSMutableArray+CreateArrayWithNumberOfObjectsAndValue.h
//  startsWithZero
//
//  Created by Carlos Santiago Cruz on 18/07/20.
//  Copyright © 2020 Carlos Santiago Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (CreateArrayWithNumberOfObjectsAndValue)
- (NSMutableArray *)createArrayWithNumberOfElements:(int)numberOfElements valueOfEachElement:(int)valueOfEachElement;
@end

NS_ASSUME_NONNULL_END
