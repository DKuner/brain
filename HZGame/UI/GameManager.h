//
//  GameManager.h
//  HZGame
//
//  Created by liwensheng on 12-7-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameManager <NSObject>
@optional
-(void)GameOver:(BOOL)Succ;
@end
