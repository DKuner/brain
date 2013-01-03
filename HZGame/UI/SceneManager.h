//
//  SceneManager.h
//  MapTest
//
//  Created by mac on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "MenuScence.h"
#import "GameScence.h"


@interface SceneManager : NSObject
{
    
}

//获取当前的场景
+(CCScene*) getCurrentScene;

//设置当前场景
+(void) setCurrentScene: (CCScene*)scene;

//开头公司LOGO
+(void) goLogoAnimation;

//开始界面
+(void) goMenu_Main;
+(void) backgoMenu_Main;

//游戏主界面
+(void) goGameScene;


//+(void) goHelp:(bool)isInGame;
//+(void) goAbout:(bool)isInGame;
//+(void) goSetting:(bool)isInGame;
//+(void) goGuangGao:(bool)isInGame;


@end
