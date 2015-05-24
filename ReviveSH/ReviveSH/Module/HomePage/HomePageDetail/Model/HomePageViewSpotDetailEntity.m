//
//  HomePageViewSpotDetailEntity.m
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageViewSpotDetailEntity.h"

@implementation HomePageViewSpotDetailEntity

-(Class)rm_itemClassForArrayProperty:(NSString *)property {
    if ([property isEqualToString:@"voices"]) {
        return [HomePageViewSpotDetailVoiceEntity class];
    }else if ([property isEqualToString:@"pictures"]){
        return [HomePageViewSpotDetailPictureEntity class];
    }
    return nil;
}

@end

@implementation HomePageViewSpotDetailVoiceEntity

@end

@implementation HomePageViewSpotDetailPictureEntity

@end