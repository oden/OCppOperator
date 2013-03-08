//
//  ID.h
//  OCppOperator
//
//  Created by oden on 13/03/08.
//  Copyright (c) 2013年 JITAKUKEIBI INC. All rights reserved.
//

#import <Foundation/Foundation.h>

class ID
{
private:
    id object;
public:
    ID(const id = nil);
    ~ID();
    operator id();
    ID operator+(const id);
};
