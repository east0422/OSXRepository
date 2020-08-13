//
//  MyProtocol.h
//  OSXTest
//
//  Created by fangdong on 15/11/3.
//  Copyright © 2015年 east. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyProtocol <NSObject>

@required
@property (nonatomic, copy) NSString *name;

/** 协议方法 */
- (void)showInfo1;

@end
