//
//  HomePageDetailViewController+Request.h
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailViewController.h"
#import "HomePageViewSpotDetailEntity.h"

@interface HomePageDetailViewController (Request)

-(void)queryViewSpotDetailSuccess:(void (^)(HomePageViewSpotDetailEntity *viewSpotDetail))success failure:(void (^)(NSError *error))failure;

@end
