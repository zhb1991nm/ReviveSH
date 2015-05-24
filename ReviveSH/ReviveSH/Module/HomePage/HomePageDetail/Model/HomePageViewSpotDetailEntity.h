//
//  HomePageViewSpotDetailEntity.h
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "BaseEntity.h"

@interface HomePageViewSpotDetailEntity : BaseEntity<RMMapping>

@property (nonatomic,copy) NSString *address;

@property (nonatomic,copy) NSString *introduce;

@property (nonatomic,copy) NSNumber *latitude;

@property (nonatomic,copy) NSNumber *view_spot_id;

@property (nonatomic,strong) NSArray *voices;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,strong) NSArray *pictures;

@property (nonatomic,copy) NSNumber *longitude;

@end

@interface HomePageViewSpotDetailVoiceEntity : BaseEntity

@property (nonatomic,copy) NSNumber *voiceId;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *url;

@property (nonatomic,copy) NSNumber *likes;

@end

@interface HomePageViewSpotDetailPictureEntity : BaseEntity

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *url;

@end
