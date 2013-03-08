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

@end
