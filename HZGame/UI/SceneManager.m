//
//  SceneManager.m
//  MapTest
//
//  Created by mac on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SceneManager.h"
#import "Menu_Effect.h"
//#import "Menu_Main.h"


@interface SceneManager ()
+(void) go: (CCLayer *)layer;
+(CCScene*) wrap: (CCLayer*)layer;
@end


@implementation SceneManager

static CCScene *currentScene = nil;

+(CCScene*) getCurrentScene
{
    return currentScene;
}

+(void) setCurrentScene: (CCScene*)scene
{
    currentScene = scene;
}

+(void) go:(CCLayer*)layer effectIndex:(int) index
{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [self wrap:layer];
    
    if ([director runningScene])
    {
        //根据字符串返回需要的类名称
        Class transition = Transitions(index);
        
        NSLog(@"hedafdf: %@", transition);
        
        //Old Method:CCXXXTransition->New Method:CCTransitionXXX
        [director replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:newScene]];
    }
    else 
    {
        [director runWithScene:newScene];
    }
}

//不使用过度效果
+(void) go:(CCLayer*)layer
{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [self wrap:layer];
    
    if ([director runningScene])
    {
        [director replaceScene: newScene];
    }
    else 
    {
        [director runWithScene:newScene];
    }
}

+(CCScene*) wrap: (CCLayer*) layer
{
    CCScene *newScene = [CCScene node];
    [newScene addChild: layer];
    return newScene;
}

//临时添加，第一个场景专用，为了保存第一个场景的scene
+(void) goFirst:(CCLayer*)layer effectIndex:(int) index
{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [self wrap:layer];
    
    currentScene = newScene;
    
    if ([director runningScene])
    {
        //根据字符串返回需要的类名称
        Class transition = Transitions(index);
        
        NSLog(@"hedafdf: %@", transition);
        
        //Old Method:CCXXXTransition->New Method:CCTransitionXXX
        [director replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:newScene]];
    }
    else 
    {
        [director runWithScene:newScene];
    }
}



/*******************************************************************/
#pragma mark 场景跳转
+(void) goLogoAnimation
{
    //CCLayer *layer = [LogoAnimation node];
   // [self go: layer];
}

+(void) goMenu_Main
{
    CCLayer *layer = [MenuScence node];
    [self go: layer effectIndex:TRANSITION_FADE];
}

+(void) backMenu_Main
{
    CCLayer *layer = [MenuScence node];
    [self go: layer effectIndex:TRANSITION_FADEBL];
}

+(void) goGameScene
{
    CCLayer *layer = [GameScence node];
    [self go: layer];
}

/**************************************************/
//+(void) goHelp:(bool)isInGame
//{
//    CCLayer *layer = [Menu_Help initWithIsInGame:isInGame];
//    [self go: layer effectIndex:TRANSITION_FADETR];
//}
//
//+(void) goAbout:(bool)isInGame
//{
//    CCLayer *layer = [Menu_About initWithIsInGame:isInGame];
//    [self go: layer effectIndex:TRANSITION_FADETR];
//}
//
//+(void) goSetting:(bool)isInGame
//{
//    CCLayer *layer = [Menu_Setting initWithIsInGame:isInGame];
//    [self go: layer effectIndex:TRANSITION_FADETR];
//}

@end












