//
//  HomePageDetailPlayerView.h
//  ReviveSH
//
//  Created by zhb on 15/5/20.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "BaseUIView.h"
typedef enum : NSUInteger {
    HomePageDetailPlayerStatusStop,
    HomePageDetailPlayerStatusPlay,
    HomePageDetailPlayerStatusPause
} HomePageDetailPlayerStatus;

@interface HomePageDetailPlayerView : BaseUIView

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *leftTimeLabel;

@property (nonatomic,strong) UILabel *rightTimeLabel;

@property (nonatomic,strong) UISlider *playerSlider;

@property (nonatomic,strong) UIButton *playButton;

@property (nonatomic,assign) HomePageDetailPlayerStatus playerStatus;

@end
