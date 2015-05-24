//
//  HomePageViewSpotFeedbackEntity.h
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "BaseEntity.h"
#import "HomePageViewSpotEntity.h"

@interface HomePageViewSpotFeedbackEntity : BaseEntity<RMMapping>

@property (nonatomic,strong) NSArray *contents;

@end
