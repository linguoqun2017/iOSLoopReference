//
//  NetworkTool.m
//  Block演练
//
//  Created by PILIPALA on 2023/6/23.
//

#import "NetworkTool.h"

@interface NetworkTool ()
@property (nonatomic,copy) void(^finishedBlock)(NSString *);
@end

@implementation NetworkTool

- (void)loadData:(void(^)(NSString *))finished {
    self.finishedBlock = finished;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作");
        [NSThread sleepForTimeInterval:2.0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"准备回调");
            
            [self handleBlock];
        });
        
    });
}

- (void)handleBlock {
    if (self.finishedBlock != nil) {
        self.finishedBlock(@"hello...");
    }
}

- (void)dealloc {
    NSLog(@"网络工具类 88");
}

@end
