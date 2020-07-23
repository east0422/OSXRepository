//
//  ProtocolAndCategory.m
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import "ProtocolAndCategory.h"
#import "MyTest.h"
#import "MyTest+CategoryPrivate.h"

@implementation ProtocolAndCategory

- (void)testProtocolMethodForIdProtocol {
    id<MyProtocol> test = [[MyTest alloc] init];
//    [test showInfo1]; // showInfo1
    if ([test respondsToSelector:@selector(showInfo1)]) {
        [test showInfo1]; // showInfo1
    }
}

- (void)testMethodForIdProtocol {
    id<MyProtocol> test = [[MyTest alloc] init];
    // 不能通过编译，报错找不到showInfo2方法, 若想直接调用需将test声明为id test = [[MyTest alloc] init];
//    [test showInfo2];
    
//    if ([test respondsToSelector:@selector(showInfo2)]) {
//        [test performSelector:@selector(showInfo2)]; // showInfo2
//    }
    
    if ([test isKindOfClass:[MyTest class]]) { // 进行类型转换
        [(MyTest *)test showInfo2]; // showInfo2
    }
}

- (void)testPrivateMethodForCategory {
    MyTest *test = [[MyTest alloc] init];
    
    // 不引入MyTest+CategoryPrivate分类会有警告：Undeclared selector 'showInfo3'但是可以编译运行
//    if ([test respondsToSelector:@selector(showInfo3)]) {
//        [test performSelector:@selector(showInfo3)]; // showInfo3
//    }
    
    // 引入MyTest+CategoryPrivate分类实现类私有方法前向引用，就可以使用类私有方法了。否则不能通过编译
    [test showInfo3];
}

@end
