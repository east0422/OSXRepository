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

// 私有方法前向引用: 只申明MyTest的私有方法，不实现
- (void)showInfo3;

@end

NS_ASSUME_NONNULL_END
