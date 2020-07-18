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
        NSString *formattedTime = [[NSString alloc] init];
        formattedTime = value >= 1000 ? [NSString stringWithFormat:@"%.20lf [s]", value] : value >= 1 ? [NSString stringWithFormat:@"%.3g[s]", value] : value >= 1e-3 ? [NSString stringWithFormat:@"%.3g[ms]", value*1e3] : value >= 1e-6 ? [NSString stringWithFormat:@"%.3g[us]", value*1e6] : value < 1e-9 ? @"0 [s]" : [NSString stringWithFormat:@"%.3g[ns]", value*1e9];
        NSLog(@"execution time: %@", formattedTime);
        
    }
    return 0;
}


