//
//  HomePageDetailSummarySectionView.m
//  ReviveSH
//
//  Created by zhb on 15/5/22.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailSummarySectionView.h"
#import "UIButton+RoundCorner.h"

@implementation HomePageDetailSummarySectionView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.summaryLabel];
        [self addSubview:self.summaryCutLine];
        [self addSubview:self.locationButton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.locationButton.frame = CGRectMake(0, self.frame.size.height - HomePageDetailLocationButtonHeight, self.frame.size.width, HomePageDetailLocationButtonHeight);
    self.summaryCutLine.frame = CGRectMake(HomePageDetailSectionPadding, self.frame.size.height - HomePageDetailLocationButtonHeight, HomePageDetailSectionContentWidth, CutLineThickness);
    self.summaryLabel.frame = CGRectMake(HomePageDetailSectionPadding, HomePageDetailSectionContentOriginY, HomePageDetailSectionContentWidth, self.frame.size.height - HomePageDetailSectionContentOriginY - HomePageDetailLocationButtonHeight);
    [_locationButton cornerd:UIRectCornerBottomLeft|UIRectCornerBottomRight radius:HomePageDetailSectionCornerRadius];[_locationButton cornerd:UIRectCornerBottomLeft|UIRectCornerBottomRight radius:HomePageDetailSectionCornerRadius];
    _locationButton.imageEdgeInsets = UIEdgeInsetsMake(12, HomePageDetailSectionPadding, 12, _locationButton.frame.size.width - 20);
}

#pragma getter & setter
-(UILabel *)summaryLabel{
    if (!_summaryLabel) {
        _summaryLabel = [[UILabel alloc] init];
        _summaryLabel.backgroundColor = [UIColor clearColor];
        _summaryLabel.textColor = HomePageDetailSummaryLabelTextColor;
        _summaryLabel.font = HomePageDetailSummaryLabelFont;
        _summaryLabel.numberOfLines = 0;
    }
    return _summaryLabel;
}

-(UIView *)summaryCutLine{
    if (!_summaryCutLine) {
        _summaryCutLine = [[UIView alloc] init];
        _summaryCutLine.backgroundColor = CutLineColor;
        _summaryCutLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    }
    return _summaryCutLine;
}

-(UIButton *)locationButton{
    if (!_locationButton) {
        _locationButton = [[UIButton alloc] init];
        _locationButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        _locationButton.backgroundColor = [UIColor clearColor];
        _locationButton.titleLabel.font = HomePageDetailLocationButtonTitleFont;
        _locationButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        _locationButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft ;
    }
    return _locationButton;
}

@end
