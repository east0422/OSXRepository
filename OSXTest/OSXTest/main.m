//
//  main.m
//  OSXTest
//
//  Created by east on 15/10/19.
//  Copyright © 2015年 east. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "basic/BasicDataType.h"
#import "property/Property.h"
#import "protocolandcategory/ProtocolAndCategory.h"
#import "thread/Thread.h"

// 基本数据类型测试
void basicDataTypeTest(void);
// property测试
void propertyTest(void);
// 协议与分类
void protocolAndCategoryTest(void);
// 线程测试
void threadTest(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        basicDataTypeTest();
//        propertyTest();
//        protocolAndCategoryTest();
//        threadTest();
    }
    return 0;
}

void basicDataTypeTest() {
    BasicDataType *bdt = [[BasicDataType alloc] init];
//    [bdt testSignedByte];
//    [bdt testFloat];
//    [bdt testArrPtr];
    [bdt testCopy];
}

void propertyTest() {
    Property *property = [[Property alloc] init];
    [property testSetterAndGetter];
    [property testStrongAndCopyIMMutableForIMMutable];
    [property testStrongAndCopyIMMutableForMutable];
    [property testStrongAndCopyMutableForIMMutable];
    [property testStrongAndCopyMutableForMutable];
}

void protocolAndCategoryTest() {
    ProtocolAndCategory *pac = [ProtocolAndCategory new];
    [pac testProtocolMethodForIdProtocol];
    [pac testMethodForIdProtocol];
    [pac testPrivateMethodForCategory];
}

void threadTest() {
    Thread *thread = [Thread new];
    [thread testNestedSyncInConcurrent];
}
