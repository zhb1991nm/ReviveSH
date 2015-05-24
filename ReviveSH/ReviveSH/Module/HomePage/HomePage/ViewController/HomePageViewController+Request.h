//
//  HomePageViewController+Request.h
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageViewSpotFeedbackEntity.h"

@interface HomePageViewController (Request)

-(void)queryHomePageViewSpotWithPageIndex:(NSUInteger)pageIndex coordinate:(NSString *)coordinate success:(void (^)(HomePageViewSpotFeedbackEntity *content))success failure:(void (^)(NSError *error))failure;

@end
