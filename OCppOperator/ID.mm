//
//  ID.m
//  OCppOperator
//
//  Created by oden on 13/03/08.
//  Copyright (c) 2013年 JITAKUKEIBI INC. All rights reserved.
//

#import "ID.h"

ID::ID(const id object)
{
    this->object = [object retain];
}

ID::~ID()
{
    [this->object release];
}
