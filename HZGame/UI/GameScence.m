//
//  GameScence.m
//  HZGame
//
//  Created by liwensheng on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameScence.h"

@implementation GameScence

-(id)init
{
    self=[super init];
    if (self) {
        CoinLayer *coinLayer=[CoinLayer node];
        coinLayer.delegate=self;
        [self addChild:coinLayer];
    }
    return self;
}
-(void)GameOver:(BOOL)Succ
{
    NSLog(@"成功?%d",Succ);
}
@end
