//
//  Dog.h
//  OSXTest
//
//  Created by east on 15/10/19.
//  Copyright © 2015年 east. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    int age;
}

@property int age;

@property (nonatomic, copy) NSString *copStr;
@property (nonatomic, strong) NSString *strongStr;
@property (nonatomic, copy) NSMutableString *muteCopyStr;
@property (nonatomic, strong) NSMutableString *muteStrongStr;

@end
