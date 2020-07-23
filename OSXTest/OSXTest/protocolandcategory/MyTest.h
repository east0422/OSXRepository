//
//  MyTest.h
//  OSXTest
//
//  Created by fangdong on 15/11/3.
//  Copyright © 2015年 east. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@interface MyTest : NSObject <MyProtocol>

/** 类自定义方法 */
- (void)showInfo2;

@end
