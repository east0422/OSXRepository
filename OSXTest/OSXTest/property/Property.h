//
//  Property.h
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 引用计数打印需要将文件标记为-fno-objc-arc */
@interface Property : NSObject

/** 对象属性setter/getter方法 */
- (void)testSetterAndGetter;

/** 声明为immutable类型分别使用copy和strong，实际为immutable */
- (void)testStrongAndCopyIMMutableForIMMutable;
/** 声明immutable类型分别使用copy与strong ，实际为mutable */
- (void)testStrongAndCopyIMMutableForMutable;
/** 声明为mutable类型分别使用copy和strong，实际为immutable */
- (void)testStrongAndCopyMutableForIMMutable;
/** 声明mutable类型分别使用copy与strong，实际为mutable */
- (void)testStrongAndCopyMutableForMutable;

@end

NS_ASSUME_NONNULL_END
