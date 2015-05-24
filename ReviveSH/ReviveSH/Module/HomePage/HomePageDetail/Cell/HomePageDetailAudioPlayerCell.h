//
//  HomePageDetailAudioPlayerCell.h
//  ReviveSH
//
//  Created by zhb on 15/5/22.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "BaseUITableViewCell.h"
typedef enum : NSUInteger {
    HomePageDetailPlayerStatusStop,
    HomePageDetailPlayerStatusPlay,
    HomePageDetailPlayerStatusPause
} HomePageDetailPlayerStatus;

@class LaudButton;

typedef void(^PlayerButtonOnClickBlock)(UIButton *button);

@interface HomePageDetailAudioPlayerCell : BaseUITableViewCell

@property (nonatomic,strong) UILabel *originTitleLabel;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *leftTimeLabel;

@property (nonatomic,strong) UILabel *rightTimeLabel;

@property (nonatomic,strong) UISlider *playerSlider;

@property (nonatomic,strong) UIButton *playButton;

@property (nonatomic,strong) LaudButton *laudButton;//赞

@property (nonatomic,assign) HomePageDetailPlayerStatus playerStatus;

@property (nonatomic,assign) NSInteger likes;

@property (nonatomic,assign) NSInteger liked;

@property (nonatomic,copy) PlayerButtonOnClickBlock playerButtonOnClickBlock;

@end

@interface LaudButton : UIButton

@end
