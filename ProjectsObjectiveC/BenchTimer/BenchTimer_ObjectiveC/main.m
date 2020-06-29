//
//  main.m
//  BenchTimer_ObjectiveC
//
//  Created by Carlos Santiago Cruz on 24/06/20.
//  Copyright © 2020 Carlos Santiago Cruz. All rights reserved.
//

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
