//
//  BasicDataType.m
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import "BasicDataType.h"

@implementation BasicDataType

- (void)testSignedByte {
    SignedByte b1 = 127;
    SignedByte b2 = 1;
    SignedByte b3 = b1 + b2;
    SignedByte b4 = 128 + 128;
    Log(@"%d %d just test",b3, b4); // -128 0
}

- (void)testFloat {
    float num = 3.2566;
    Log(@"%.2f", floor(num*100)/100); // 3.25
   
    NSNumber *number = @(num);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    [formatter setPositiveFormat:@"###0.00"];
    formatter.roundingMode = NSNumberFormatterRoundDown;
    formatter.maximumFractionDigits = 2;
    Log(@"%@", [formatter stringFromNumber:number]); // 3.25
}

- (void)testArrPtr {
    int a[5] = {1, 2, 3, 4, 5};
    int *ptr = (int *)(&a + 1);
    Log(@"%d, %d", *(a+1), *(ptr - 1)); // 2, 5
}

- (void)testCopy {
    NSString *str = @"hello";
//    NSString *str = [NSMutableString stringWithString:@"hello"]; // str1地址与str地址是不一样的
    NSString *str1 = [str copy];
    NSMutableString *str2 = [str mutableCopy];
    NSLog(@"%p, %p, %p", str, str1, str2); // 0x100004198, 0x100004198, 0x100704db0
    str = @"hi";
    [str2 appendString:@" world"];
    NSLog(@"%p, %p, %p, %@, %@, %@", str, str1, str2, str, str1, str2); // 0x100004238, 0x100004198, 0x100704db0, hi, hello, hello world
    
    NSArray *arr = @[@"a", @"b", @"c"];
//    NSArray *arr = [NSMutableArray arrayWithArray:@[@"a", @"b", @"c"]]; // arr1地址与arr地址也是不一样的
    NSArray *arr1 = [arr copy];
    NSMutableArray *arr2 = [arr mutableCopy];
    NSLog(@"%p, %p, %p", arr, arr1, arr2); // 0x100600420, 0x100600420, 0x100600850
    [arr2 addObject:@"d"];
    NSLog(@"%p, %p, %p, %@, %@, %@", arr, arr1, arr2, arr, arr1, arr2); // 只有arr2数组添加了d, arr和arr1没有改变
}

@end
