//
//  NSObject+OCppOperator.h
//  OCppOperator
//
//  Created by oden on 13/03/08.
//  Copyright (c) 2013年 JITAKUKEIBI INC. All rights reserved.
//

/*!
 @header NSObject+OCppOperator.h
 @abstract NSObjectにIDプロパティを付けるよ＼(^o^)／
 */
#import <Foundation/Foundation.h>
#import "ID.h"

/*!
 @class NSObject
 @abstract NSObjectのカテゴリ
 */
@interface NSObject(OCppOperator)

/*!
 @property ID
 @abstract ID型のキャスト用プロパティ
 @return selfをそのままreturnします。その時、ID型のコピーコンストラクタが実行されて、ID型への暗黙の型変換が発生します。
 */
@property (nonatomic, readonly) ID ID;

@end
