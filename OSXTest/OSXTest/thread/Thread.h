//
//  Thread.h
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Thread : NSObject

/** 并行队列嵌套同步操作 */
- (void)testNestedSyncInConcurrent;

@end

NS_ASSUME_NONNULL_END
