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

@end
