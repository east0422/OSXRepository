//
//  Property.m
//  OSXTest
//
//  Created by dfang on 2020-7-23.
//  Copyright © 2020 east. All rights reserved.
//

#import "Property.h"
#import "Dog.h"

@implementation Property

- (void)testSetterAndGetter {
    Dog *dog = [[Dog alloc] init];
    [dog setAge:100]; // setAge:100
    Log(@"dog age is:%d", dog.age); // 100
}

- (void)testStrongAndCopyIMMutableForIMMutable {
    Dog *dog = [[Dog alloc] init];
    NSString *str = @"hello";
    dog.copStr = str;
    dog.strongStr = str;
    
    // 0x100004198, 0x100004198, 0x100004198
    Log(@"%p, %p, %p", str, dog.copStr, dog.strongStr);
    // hello, hello, hello
    Log(@"%@, %@, %@", str, dog.copStr, dog.strongStr);
    // 18446744073709551615, 18446744073709551615, 18446744073709551615
    Log(@"%lu, %lu, %lu", [str retainCount], [dog.copStr retainCount], [dog.strongStr retainCount]);
}

- (void)testStrongAndCopyIMMutableForMutable {
    Dog *dog = [[Dog alloc] init];
    NSMutableString *mutStr = [NSMutableString stringWithString:@"hello"];
    dog.copStr = mutStr;
    dog.strongStr = mutStr;
    
    // 0x10205e3f0, 0x68017644ff2ce9bf, 0x10205e3f0
    Log(@"%p, %p, %p", mutStr, dog.copStr, dog.strongStr);
    // hello, hello, hello
    Log(@"%@, %@, %@", mutStr, dog.copStr, dog.strongStr);
    // 2, 18446744073709551615, 2
    Log(@"%lu, %lu, %lu", [mutStr retainCount], [dog.copStr retainCount], [dog.strongStr retainCount]);
    [mutStr appendString:@"world!"];
    // 0x10205e3f0, 0x68017644ff2ce9bf, 0x10205e3f0
    Log(@"%p, %p, %p", mutStr, dog.copStr, dog.strongStr);
    // helloworld!, hello, helloworld!
    Log(@"%@, %@, %@", mutStr, dog.copStr, dog.strongStr);
    // 2, 18446744073709551615, 2
    Log(@"%lu, %lu, %lu", [mutStr retainCount], [dog.copStr retainCount], [dog.strongStr retainCount]);
}

- (void)testStrongAndCopyMutableForIMMutable {
    Dog *dog = [[Dog alloc] init];
    NSString *str = @"hello";
    // 警告：Incompatible pointer types assigning to 'NSMutableString *' from 'NSString *'
    dog.muteStrongStr = str;
    dog.muteCopyStr = str;
    
    // 0x100004198, 0x100004198, 0x100004198
    Log(@"%p, %p, %p", str, dog.muteCopyStr, dog.muteStrongStr);
    // hello, hello, hello
    Log(@"%@, %@, %@", str, dog.muteCopyStr, dog.muteStrongStr);
    // 18446744073709551615, 18446744073709551615, 18446744073709551615
    Log(@"%lu, %lu, %lu", [str retainCount], [dog.muteCopyStr retainCount], [dog.muteStrongStr retainCount]);
    
    // 运行报错，系统奔溃：Attempt to mutate immutable object with appendString:
//    [dog.muteStrongStr appendString:@"aaaa"];
//    [dog.muteCopyStr appendString:@"bbbb"];
    
    // 警告：Incompatible pointer types assigning to 'NSMutableString *' from 'NSString *'
    dog.muteCopyStr = @"hi";
    
    // 0x100004198, 0x100004238, 0x100004198
    Log(@"%p, %p, %p", str, dog.muteCopyStr, dog.muteStrongStr);
    // hello, hi, hello
    Log(@"%@, %@, %@", str, dog.muteCopyStr, dog.muteStrongStr);
    // 18446744073709551615, 18446744073709551615, 18446744073709551615
    Log(@"%lu, %lu, %lu", [str retainCount], [dog.muteCopyStr retainCount], [dog.muteStrongStr retainCount]);
}

- (void)testStrongAndCopyMutableForMutable {
    Dog *dog = [[Dog alloc] init];
    NSMutableString *muteStr = [NSMutableString stringWithString:@"hello"];
    dog.muteStrongStr = muteStr;
    dog.muteCopyStr = muteStr;
    
    // 0x100582500, 0x382cbfe199e511a5, 0x100582500
    Log(@"%p, %p, %p", muteStr, dog.muteCopyStr, dog.muteStrongStr);
    // hello, hello, hello
    Log(@"%@, %@, %@", muteStr, dog.muteCopyStr, dog.muteStrongStr);
    // 2, 18446744073709551615, 2
    Log(@"%lu, %lu, %lu", [muteStr retainCount], [dog.muteCopyStr retainCount], [dog.muteStrongStr retainCount]);
    
    // 系统奔溃：[NSTaggedPointerString appendString:]: unrecognized selector sent to instance 0x382cbfe199e511a5'
//    [dog.muteCopyStr appendString:@"aaaa"];
    
    [muteStr appendString:@"world"];
//    [dog.muteStrongStr appendString:@"world"]; // 与上一行语句等效
    // 0x100582500, 0x382cbfe199e511a5, 0x100582500
    Log(@"%p, %p, %p", muteStr, dog.muteCopyStr, dog.muteStrongStr);
    // helloworld, hello, helloworld
    Log(@"%@, %@, %@", muteStr, dog.muteCopyStr, dog.muteStrongStr);
    // 2, 18446744073709551615, 2
    Log(@"%lu, %lu, %lu", [muteStr retainCount], [dog.muteCopyStr retainCount], [dog.muteStrongStr retainCount]);
}

@end
