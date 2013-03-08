//
//  OCppOperatorTests.m
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
    catch(exception& e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testObjC2Cpp
{
    try {
        ID object = @"test";
    } catch (exception& e) {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testObjC2CppMRC
{
    try {
        @autoreleasepool {
            ID object = [[[NSObject alloc] init] autorelease];
            STAssertTrue([object retainCount] == 2, @"不正なretainCount値です");
        }
    } catch (exception& e) {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testCpp2ObjC
{
    try {
        @autoreleasepool {
            id object = ID();
            STAssertNil(object, @"IDクラスの初期化処理が不正です");
        }
    } catch (exception e) {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

- (void)testPlusOperation
{
    try
    {
        @autoreleasepool
        {
            ID object = (ID)@"a" + @"b" + @(1) + @(3.14);
            STAssertEqualObjects(object, @"ab13.14", @"operator+(id)が失敗しました");
        }
    }
    catch(exception e)
    {
        STFail([NSString stringWithCString:e.what() encoding:NSUTF8StringEncoding]);
    }
}

@end
