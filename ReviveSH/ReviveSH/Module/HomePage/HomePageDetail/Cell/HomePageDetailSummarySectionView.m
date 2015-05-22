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
}

#pragma getter & setter
-(UILabel *)summaryLabel{
    if (!_summaryLabel) {
        _summaryLabel = [[UILabel alloc] init];
        _summaryLabel.backgroundColor = [UIColor clearColor];
        _summaryLabel.textColor = HomePageSummaryLabelTextColor;
    }
    return _summaryLabel;
}

-(UIView *)summaryCutLine{
    if (!_summaryCutLine) {
        _summaryCutLine = [[UIView alloc] init];
        _summaryCutLine.backgroundColor = CutLineColor;
    }
    return _summaryCutLine;
}

-(UIButton *)locationButton{
    if (!_locationButton) {
        _locationButton = [[UIButton alloc] init];
        [_locationButton cornerd:UIRectCornerBottomLeft|UIRectCornerBottomRight radius:HomePageDetailSectionCornerRadius];
        _locationButton.backgroundColor = HomePageDetailSectionBackgroundColor;
    }
    return _locationButton;
}

@end
