//
//  HomePageDetailAudioPlayerCell.m
//  ReviveSH
//
//  Created by zhb on 15/5/22.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailAudioPlayerCell.h"
#import "HomePageDetailConstants.h"

@implementation HomePageDetailAudioPlayerCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.playButton];
        [self.contentView addSubview:self.originTitleLabel];
        [self.contentView addSubview:self.laudButton];
        [self setFrames];
    }
    return self;
}

-(void)setFrames{
    CGFloat height = HomePageDetailAudioPlayerCellHeight;
    CGFloat playButtonOriginY = (height - HomePageDetailAudioPlayerCellPlayButtonDiameter)*0.5f;
    _playButton.frame = CGRectMake(0, playButtonOriginY, HomePageDetailAudioPlayerCellPlayButtonDiameter, HomePageDetailAudioPlayerCellPlayButtonDiameter);
    CGFloat originTitleLabelOriginX = CGRectGetMaxX(_playButton.frame) + HomePageDetailSectionPadding;
    CGFloat originTitleLabelOriginY = CGRectGetMinY(_playButton.frame);
    CGFloat originTitleLabelWidth = HomePageDetailSectionContentWidth - originTitleLabelOriginX;
    CGFloat originTitleLabelHeight = CGRectGetHeight(_playButton.frame);
    _originTitleLabel.frame = CGRectMake(originTitleLabelOriginX, originTitleLabelOriginY, originTitleLabelWidth, originTitleLabelHeight);
    
    CGFloat laudButtonOriginX = HomePageDetailSectionWidth - HomePageDetailAudioPlayerCellLaudButtonWidth - HomePageDetailSectionPadding;
    CGFloat loadButtonOriginY = (height - HomePageDetailAudioPlayerCellLaudButtonWidth)*0.5f;
    _laudButton.frame = CGRectMake(laudButtonOriginX, loadButtonOriginY, HomePageDetailAudioPlayerCellLaudButtonWidth, HomePageDetailAudioPlayerCellLaudButtonHeight);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}

#pragma mark event response
-(IBAction)laudButtonOnClick:(UIButton *)sender{
    if (sender.selected) {
        return;
    }
    sender.selected = YES;
    [sender setTitle:[NSNumber numberWithInteger:++_likes].stringValue forState:UIControlStateNormal];
}

#pragma mark getter & setter
-(UIButton *)playButton{
    if (!_playButton) {
        _playButton = [[UIButton alloc] init];
        [_playButton setImage:[UIImage imageNamed:@"play-icon"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"play-pause"] forState:UIControlStateSelected];
    }
    return _playButton;
}

-(UILabel *)originTitleLabel{
    if (!_originTitleLabel) {
        _originTitleLabel = [[UILabel alloc] init];
        _originTitleLabel.textAlignment = NSTextAlignmentLeft;
        _originTitleLabel.textColor = HomePageDetailAudioPlayerCellTileColor;
        _originTitleLabel.font = HomePageDetailAudioPlayerCellTileFont;
        
    }
    return _originTitleLabel;
}

-(UIButton *)laudButton{
    if (!_laudButton) {
        _laudButton = [[LaudButton alloc] init];
        [_laudButton setImage:[UIImage imageNamed:@"like-gray"] forState:UIControlStateNormal];
        [_laudButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateSelected];
        _laudButton.titleLabel.font = HomePageDetailAudioPlayerCellLaudButtonTileFont;
        [_laudButton setTitleColor:HomePageDetailAudioPlayerCellLaudButtonTileColor forState:UIControlStateNormal];
        [_laudButton addTarget:self action:@selector(laudButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _laudButton;
}

@end

@implementation LaudButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((self.frame.size.width - HomePageDetailAudioPlayerCellLaudButtonImageWidth) * 0.5, 0, HomePageDetailAudioPlayerCellLaudButtonImageWidth, HomePageDetailAudioPlayerCellLaudButtonImageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, HomePageDetailAudioPlayerCellLaudButtonImageHeight, self.frame.size.width, 20);
}

@end
