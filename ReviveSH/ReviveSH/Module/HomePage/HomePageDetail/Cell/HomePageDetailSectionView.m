//
//  HomePageDetailSectionView.m
//  ReviveSH
//
//  Created by zhb on 15/5/22.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailSectionView.h"

@implementation HomePageDetailSectionView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.titleCutLine];
        self.backgroundColor = HomePageDetailSectionBackgroundColor;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(HomePageDetailSectionPadding, 0, HomePageDetailSectionContentWidth, CutLineOriginY);
    _titleCutLine.frame = CGRectMake(HomePageDetailSectionPadding, CutLineOriginY, HomePageDetailSectionContentWidth, CutLineThickness);
}


#pragma mark getter & setter
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = HomePageDetailSectionTitleColor;
        _titleLabel.font = HomePageDetailSectionTitleFont;
    }
    return _titleLabel;
}

-(UIView *)titleCutLine{
    if (!_titleCutLine) {
        _titleCutLine = [[UIView alloc] init];
        _titleCutLine.backgroundColor = CutLineColor;
    }
    return _titleCutLine;
}

@end
