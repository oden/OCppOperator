//
//  ID.h
//  OCppOperator
//
//  Created by oden on 13/03/08.
//  Copyright (c) 2013年 JITAKUKEIBI INC. All rights reserved.
//

/*!
 @header ID.h
 C++のIDクラスを定義するヘッダファイル。
 */
#import <Foundation/Foundation.h>

/*!
 @class ID
 @abstract IDクラス。
 @discussion Objective-Cのid型を引数に取るコピーコンストラクタと、
 id型への暗黙の型変換のためのoperatorを定義することで、
 Objective-CとC++とのスムーズな型変換を実現・・
 できてたらいいなあと思って作ってみた(´・ω・`)
 */
class ID
{
private:
    /*!
     @field object
     @abstract id型のオブジェクト。
     @discussion デフォルトはnil。
     */
    id object;
public:
    /*!
     @method ID
     @abstract コンストラクタ。デフォルトコンストラクタ兼コピーコンストラクタ
     @discussion id型からの暗黙の型変換を実現している。
     @param id 無指定の場合、nil。暗黙の型変換により、ID型を渡すこともできる。渡されたオブジェクトはretainされる。
     */
    ID(const id = nil);
    /*!
     @method ID
     @abstract コピーコンストラクタ。
     @discussion id型からの暗黙の型変換を実現している。
     @param int NSNumberに変換可能な型。
     */
    ID(const int);
    /*!
     @method ~ID
     @abstract デストラクタ。
     @discussion objectフィールドはreleaseされる。
     */
    ~ID();
    /*!
     @method operator id
     @abstract id型への型変換関数。
     @discussion id型への暗黙の型変換を実現している。
     @return id
     @abstract objectフィールド。
     */
    operator const id() const;
    /*!
     @method operator+
     @abstract 加算演算子オーバーロード。
     @discussion objectフィールドのdescription文字列と引数のdescription文字列を結合する。
     @param id
     @return ID
     */
    ID operator+(const id) const;
    /*!
     @method operator+=
     @abstract 加算後代入演算子オーバーロード。
     @discussion objectフィールドのdescription文字列と引数のdescription文字列を結合する。
     @param id
     @return ID&
     */
    ID& operator+=(const id);
};
