//
//  ID.mm
//  OCppOperator
//
//  Created by oden on 13/03/08.
//  Copyright (c) 2013年 JITAKUKEIBI INC. All rights reserved.
//

#import "ID.h"

ID::ID(const id source)
{
    this->object = [source retain];
}

ID::~ID()
{
    [this->object release];
}

#pragma mark - Operators

ID::operator id()
{
    return this->object;
}

ID ID::operator+(const id source)
{
    return [[this->object description] stringByAppendingFormat:@"%@", source];
}

ID& ID::operator+=(ID source)
{
    [this->object autorelease];
    this->object = [[*this stringByAppendingFormat:@"%@", (id)source] retain];
    return *this;
}

BOOL ID::operator==(const ID source)
{
    return [this->object isEqual:source.object];
}
