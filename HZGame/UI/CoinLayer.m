//
//  CoinLayer.m
//  HZGame
//
//  Created by liwensheng on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoinLayer.h"


@interface CoinLayer(Private)
-(void)InitCoinData;
-(void)InitCoinUI;
-(CGPoint)GetPosFromIndex:(int)nIndex;
-(int)GetIndexFromRealPos:(CGPoint)rpos;
@end


@implementation CoinLayer
@synthesize delegate;
-(id)init
{
    self=[super init];
    if (self) {
        [self InitCoinData];
        [self InitCoinUI];
        self.isTouchEnabled=YES;
    }
    return self;
}
-(void)InitCoinData
{
    CGSize winWize=[[CCDirector sharedDirector]winSize];
    int bordWidth=XCoinNum*coinWidth;
    int bordHeight=YCoinNum*coinHeight;
    
    ncoinLeftX=(winWize.width-bordWidth)/2;
    ncoinLeftY=(winWize.height-bordHeight)/2;
    //棋盘数据
    int tempCoinData[]={
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,
        0,0,0,1,0,0,0,0,0,
        0,0,0,1,0,0,0,0,0,
        0,0,0,1,1,1,1,0,0
    };
    rightscrIndex=51;
    rightdestIndex=48;
    for (int i=0; i<CoinsNum; ++i) {
        coinData[i]=tempCoinData[i];
    }

    
}
-(void)InitCoinUI
{
    int nIndex=0;
    for (int i=0; i<YCoinNum; ++i) {
        for (int j=0; j<XCoinNum; j++) {
            nIndex=i*XCoinNum+j;
            if (coinData[nIndex]>0) {
                CGPoint pos=[self GetPosFromIndex:nIndex];
                CoinSprite *coin=[[CoinSprite alloc]InitWithDelegate];
                coin.tag=1000+nIndex;
                coin.position=pos;
                [self addChild:coin];
                [coin release];
            }
        }
    }
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [self convertTouchToNodeSpace:touch];

    int nIndex=[self GetIndexFromRealPos:point];
    if (nIndex>0) {
        CCNode *selNode=[self getChildByTag:1000+nIndex];
        if (selNode) {
            curSelIndex=nIndex;
            SelecedNode=selNode;
        }
    }
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (SelecedNode) {
        UITouch* touch = [touches anyObject];
        CGPoint point = [self convertTouchToNodeSpace:touch];
        int nIndex=[self GetIndexFromRealPos:point];
        CGPoint rightPos=[self GetPosFromIndex:nIndex];
        //动画
        CCAction * move=[CCMoveTo actionWithDuration:0.4 position:rightPos];
        [SelecedNode runAction:move];
        SelecedNode=nil;
        
        BOOL bSuc=NO;
        if (rightscrIndex==curSelIndex&&rightdestIndex==nIndex) {
            bSuc=YES;
        }
        if (delegate) {
            [delegate GameOver:bSuc];
        }
    }
}
-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [self convertTouchToNodeSpace:touch];
    if (SelecedNode) {
        SelecedNode.position=point;
    }
}
-(CGPoint)GetPosFromIndex:(int)nIndex
{
    CGPoint result;
    int nrow=nIndex/XCoinNum;
    int ncol=nIndex%XCoinNum;
    result.x=ncoinLeftX+ncol*coinWidth+coinWidth/2;
    result.y=ncoinLeftY+nrow*coinHeight+coinHeight/2;
    return result;
}
-(int)GetIndexFromRealPos:(CGPoint)rpos
{
    if (rpos.x<ncoinLeftX||rpos.y<ncoinLeftY) {
        return -1;
    }
    if (rpos.x>ncoinLeftX+coinWidth*XCoinNum) {
        return -1;
    }
    if (rpos.y>ncoinLeftY+coinHeight*YCoinNum) {
        return -1;
    }
    int nx=(rpos.x-ncoinLeftX)/coinWidth;
    if ((int)(rpos.x-ncoinLeftX)%coinWidth>0) {
       // nx+=1;
    }
    int ny=(rpos.y-ncoinLeftY)/coinHeight;
    if ((int)(rpos.y-ncoinLeftY)%coinHeight>0) {
       // ny+=1;
    }
    return ny*XCoinNum+nx;
}
@end
