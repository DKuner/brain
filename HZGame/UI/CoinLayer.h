//
//  CoinLayer.h
//  HZGame
//
//  Created by liwensheng on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "CoinSprite.h"
#import "GameManager.h"

#define     XCoinNum    9
#define     YCoinNum    6
#define     coinWidth   108
#define     coinHeight  100
#define     CoinsNum     XCoinNum*YCoinNum

@interface CoinLayer : CCLayer
{
    //金币 坐标系示意
    /*
     8  9   0   11
     4  5   6   7
     0  1   2   3
     */
    int coinData[CoinsNum];
    //金币左下角
    int ncoinLeftX;
    int ncoinLeftY;
    CCNode  *SelecedNode;

    id<GameManager> delegate;
    int rightdestIndex;//需要移动点 金币
    int rightscrIndex;//移动目标点 金币
    int curSelIndex;//当前选择的金币
}
@property(nonatomic,assign) id<GameManager> delegate;
@end
