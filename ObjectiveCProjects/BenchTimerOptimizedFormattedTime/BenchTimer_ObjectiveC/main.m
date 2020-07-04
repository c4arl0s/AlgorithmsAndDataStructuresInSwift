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


