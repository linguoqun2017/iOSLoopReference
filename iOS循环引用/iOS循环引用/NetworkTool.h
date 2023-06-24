//
//  NetworkTool.h
//  Block演练
//
//  Created by PILIPALA on 2023/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkTool : NSObject

- (void)loadData:(void(^)(NSString *))finished;

@end

NS_ASSUME_NONNULL_END
