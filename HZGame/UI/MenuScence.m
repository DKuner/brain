//
//  MenuScence.m
//  HZGame
//
//  Created by liwensheng on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MenuScence.h"
#import "SceneManager.h"
@implementation MenuScence

-(id)init
{
    self=[super init];
    if (self) {
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        CCSprite *bgMenu=[CCSprite spriteWithFile:@"menu_bg.png"];
        bgMenu.position=ccp(winSize.width/2, winSize.height/2);
        [self addChild:bgMenu];
        
        CCMenuItemImage *btnTest=[CCMenuItemImage itemFromNormalImage:@"compartment_X_0.png" selectedImage:@"compartment_X_1.png"target:self selector:@selector(StartGame:)];
        CCMenu *testMenu=[CCMenu menuWithItems:btnTest, nil];
        [self addChild:testMenu];
    }
    return self;
}

-(void)StartGame:(id)sender
{
    [SceneManager goGameScene];
}
@end
