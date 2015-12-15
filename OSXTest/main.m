//
//  main.m
//  OSXTest
//
//  Created by east on 15/10/19.
//  Copyright © 2015年 east. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "MyTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        SignedByte b1 = 128;
        SignedByte b2 = 128;
        SignedByte b3 = b1 + b2;
        NSLog(@"%d just test",b3);
  
    /**
         // 测试1
        Dog *dog = [[Dog alloc] init];
        [dog setAge:100];
    */
        
  /** // 测试2
        id<MyProtocol> test = [[MyTest alloc] init];
        if ([test respondsToSelector:@selector(showInfo)]) {
            [test showInfo];
        }
//        [test showInfo2]; // 报错找不到showInfo2方法
   */
        
        // 测试3
        id test3 = [[MyTest alloc] init];
//        [test3 showInfo3]; // 报错找不到showInfo3方法
        
    }
    return 0;
}
