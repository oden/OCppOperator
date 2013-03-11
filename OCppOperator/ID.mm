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

ID::operator const id() const
{
    return this->object;
}

ID ID::operator+(const id source) const
{
    return [[this->object description] stringByAppendingFormat:@"%@", source];
}

ID& ID::operator+=(const id source)
{
    [this->object autorelease];
    this->object = [[*this stringByAppendingFormat:@"%@", source] retain];
    return *this;
}
