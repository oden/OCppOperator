//
//  OCppOperatorTests.mm
//  OCppOperatorTests
//
//  Created by oden on 13/03/08.
//  Copyright (c) 2013年 JITAKUKEIBI INC. All rights reserved.
//

#import "OCppOperatorTests.h"
#import "OCppOperator.h"
#import <exception>

using namespace std;

@implementation OCppOperatorTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testInitialize
{
    try
    {
        ID object = ID();
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testObjC2Cpp
{
    try
    {
        ID object = @"test";
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testObjC2CppMRC
{
    try
    {
        ID object = [[[NSObject alloc] init] autorelease];
        STAssertTrue([object retainCount] == 2, @"不正なretainCount値です");
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testCpp2ObjC
{
    try
    {
        id object = ID();
        STAssertNil(object, @"IDクラスの初期化処理が不正です");
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testPlusOperation
{
    try
    {
        ID object = (ID)@"a" + @"b" + @(1) + @(3.14);
        STAssertEqualObjects(object, @"ab13.14", @"operator+(id)が失敗しました");
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testPlusNSNumberOperation
{
    try
    {
        ID object = (ID)@(1) + @(3.14);
        STAssertEqualObjects(object, @(4.14), @"operator+(NSNumber*)が失敗しました");
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testPlusEqualOperation
{
    try
    {
        ID object = @"abc";
        object += @"def";
        STAssertEqualObjects(object, @"abcdef", @"operator+=(id)が失敗しました");
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testNSObjectProperty
{
    try {
        ID object = @"abcd".ID + @"efg" + @(50);
        STAssertEqualObjects(object, @"abcdefg50", @"NSObject.IDが失敗しました");
    } catch (exception e) {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

@end
