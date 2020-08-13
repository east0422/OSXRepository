//
//  BasicDataType.h
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicDataType : NSObject

/** SignedByte：signed char -128~127 */
- (void)testSignedByte;
/** 浮点数保留指定小数点位数不四舍五入 */
- (void)testFloat;
/** 数组加1，数组指针加1 */
- (void)testArrPtr;
/** mutableCopy与copy*/
- (void)testCopy;

@end

NS_ASSUME_NONNULL_END
