//
//  HomePageDetailViewController+Request.m
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailViewController+Request.h"

@implementation HomePageDetailViewController (Request)

-(void)queryViewSpotDetailSuccess:(void (^)(HomePageViewSpotDetailEntity *viewSpotDetail))success failure:(void (^)(NSError *error))failure{
    if (!self.view_spot_id) {
        return;
    }
    NSString *subUrl = [@"xlab-revivesh-rest-srv/viewSpot/findViewSpot/" stringByAppendingString:self.view_spot_id.stringValue];
    [self.requestManager requestClassMethod:GET subUrl:subUrl responseClass:[HomePageViewSpotDetailEntity class] parameters:nil success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
