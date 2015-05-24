//
//  HomePageViewSpotFeedbackEntity.m
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageViewSpotFeedbackEntity.h"

@implementation HomePageViewSpotFeedbackEntity

-(Class)rm_itemClassForArrayProperty:(NSString *)property {
    if ([property isEqualToString:@"contents"]) {
        return [HomePageViewSpotEntity class];
    }
    return nil;
}

@end
