//
//  Thread.m
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import "Thread.h"

@implementation Thread

// 1,2,3,4,5或1,2,3,5,4或1,2,3,5  (4子线程，其他都为主线程，可能主线程执行完毕退出了4还未执行)
- (void)testNestedSyncInConcurrent {
    dispatch_queue_t q = dispatch_queue_create("nestedsyncinconcurrent", DISPATCH_QUEUE_CONCURRENT);
    // 任务嵌套
    dispatch_sync(q, ^{
        Log(@"1 %@", [NSThread currentThread]);
        dispatch_sync(q, ^{
            Log(@"2 %@", [NSThread currentThread]);
            dispatch_sync(q, ^{
                Log(@"3 %@", [NSThread currentThread]);
            });
        });
        dispatch_async(q, ^{ // 子线程
            Log(@"4 %@", [NSThread currentThread]);
        });
        Log(@"5 %@", [NSThread currentThread]);
    });
}

@end
