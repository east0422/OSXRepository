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
//#import "MyTest+CategoryPrivate.h"

// SignedByte：signed char -128~127
void testSignedByte(void);
// 对象属性setter/getter方法
void testProperty(void);
// 协议及私有方法
void testProtocol(void);
// 数组加1，数组指针加1
void testArrPtr(void);
// 浮点数保留指定小数点位数不四舍五入
void testFloat(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        testSignedByte();
//        testProperty();
//        testProtocol();
//        testArrPtr();
        testFloat();
        
    }
    return 0;
}

void testSignedByte() {
    SignedByte b1 = 127;
    SignedByte b2 = 1;
    SignedByte b3 = b1 + b2;
    SignedByte b4 = 128 + 128;
    NSLog(@"%d %d just test",b3, b4); // -128 0
}

void testProperty() {
    Dog *dog = [[Dog alloc] init];
    [dog setAge:100];
    NSLog(@"dog age is:%d", dog.age); // 100
}

void testProtocol() {
    id<MyProtocol> test = [[MyTest alloc] init];
    if ([test respondsToSelector:@selector(showInfo)]) {
        [test showInfo]; // showInfo
    }
//    [test showInfo2]; // 报错找不到showInfo2方法
    if ([test isKindOfClass:[MyTest class]]) {
        if ([test respondsToSelector:@selector(showInfo2)]) {
            [test performSelector:@selector(showInfo2)]; // showInfo2
//            [(MyTest *)test showInfo2]; // showInfo2
        }
        
         if ([test respondsToSelector:@selector(showInfo3)]) {
            [test performSelector:@selector(showInfo3)]; // showInfo3
//            [(MyTest *)test showInfo3]; // 编译报错，showInfo3对于MyTest不可见
        }
    }
    
    // 测试
    id test2 = [[MyTest alloc] init];
    [test2 showInfo2]; // showInfo2
    // 引入MyTest+CategoryPrivate分类实现类私有方法前向引用，就可以使用类私有方法了
//    [test2 showInfo3]; // 编译报错，找不到showInfo3方法
}

void testArrPtr() {
    int a[5] = {1, 2, 3, 4, 5};
    int *ptr = (int *)(&a + 1);
    printf("%d, %d\n", *(a+1), *(ptr - 1)); // 2, 5
}

void testFloat() {
    float num = 3.2566;
    NSLog(@"%.2f", floor(num*100)/100); // 3.25
   
    NSNumber *number = @(num);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    [formatter setPositiveFormat:@"###0.00"];
    formatter.roundingMode = NSNumberFormatterRoundDown;
    formatter.maximumFractionDigits = 2;
    NSLog(@"%@", [formatter stringFromNumber:number]); //3.25
}
