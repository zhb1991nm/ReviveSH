//
//  HomePageDetailAudioPlayerView.m
//  ReviveSH
//
//  Created by zhb on 15/5/23.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailAudioPlayerView.h"

@implementation HomePageDetailAudioPlayerView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.playerTableView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.playerTableView.frame = CGRectMake(HomePageDetailSectionPadding, HomePageDetailSectionContentOriginY, HomePageDetailSectionContentWidth, self.frame.size.height - HomePageDetailSectionContentOriginY);
    self.playerTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
}

-(UITableView *)playerTableView{
    if (!_playerTableView) {
        _playerTableView  = [[UITableView alloc] init];
        _playerTableView.backgroundColor = [UIColor clearColor];
        _playerTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _playerTableView;
}

@end
