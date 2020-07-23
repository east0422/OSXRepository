//
//  MyTest+CategoryPrivate.h
//  OSXTest
//
//  Created by dfang on 2020-6-17.
//  Copyright © 2020 east. All rights reserved.
//

#import <AppKit/AppKit.h>


#import "MyTest.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTest (CategoryPrivate)

/** 分类私有方法前向引用: 分类中只申明原类的私有方法而不实现，从而实现调用原类的私有方法 */
- (void)showInfo3;

@end

NS_ASSUME_NONNULL_END
