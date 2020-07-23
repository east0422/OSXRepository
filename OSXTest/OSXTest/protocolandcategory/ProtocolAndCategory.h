//
//  ProtocolAndCategory.h
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProtocolAndCategory : NSObject

/** 遵循协议的id对象调用协议方法，可以直接调用协议中定义方法 */
- (void)testProtocolMethodForIdProtocol;
/** 遵守协议id对象调用实际类对象方法， 不能直接调用原类中定义方法 */
- (void)testMethodForIdProtocol;
/** 在分类头文件中定义原类私有方法而实现文件中并不实现，再引入分类可完成对私有方法的访问 */
- (void)testPrivateMethodForCategory;

@end

NS_ASSUME_NONNULL_END
