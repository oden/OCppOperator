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

ID::ID(const int t)
{
    this->object = [@(t) retain];
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
    if ([*this isKindOfClass:[NSNumber class]] &&
        [source isKindOfClass:[NSNumber class]])
    {
        return *this + (NSNumber*)source;
    }
    return [[this->object description] stringByAppendingFormat:@"%@", source];
}

ID ID::operator+(const NSNumber* const number) const
{
    if (![*this isKindOfClass:[NSNumber class]])
    {
        return *this + (id)number;
    }
    
    id left = [NSDecimalNumber decimalNumberWithString:[*this description]];
    id right = [NSDecimalNumber decimalNumberWithString:[number description]];
    return [left decimalNumberByAdding:right];
}

ID& ID::operator+=(const id source)
{
    [*this autorelease];
    this->object = [[*this stringByAppendingFormat:@"%@", source] retain];
    return *this;
}
