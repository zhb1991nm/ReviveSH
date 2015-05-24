//
//  HomePageViewController+Request.m
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageViewController+Request.h"
#define HomePageViewSpotUrl @"xlab-revivesh-rest-srv/viewSpot/queryHomePageViewSpot"

@implementation HomePageViewController (Request)

-(void)queryHomePageViewSpotWithPageIndex:(NSUInteger)pageIndex coordinate:(NSString *)coordinate success:(void (^)(HomePageViewSpotFeedbackEntity *content))success failure:(void (^)(NSError *error))failure{
    NSDictionary *parameterDict = @{@"pageIndex":[NSNumber numberWithInteger:pageIndex],
                                    @"coordinate":coordinate};
    [self.requestManager requestClassMethod:POST subUrl:HomePageViewSpotUrl responseClass:[HomePageViewSpotFeedbackEntity class] parameters:parameterDict success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
