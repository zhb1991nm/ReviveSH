//
//  HomePageWaterFallCell.m
//  ReviveSH
//
//  Created by zhb on 15/5/19.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageWaterFallCell.h"

@implementation HomePageWaterFallCell

-(instancetype)initWithIdentifier:(NSString *)identifier{
    self = [super initWithIdentifier:identifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

-(void)initSubViews{
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    _descriptionLabel = [[UILabel alloc] init];
    _descriptionLabel.backgroundColor = [UIColor whiteColor];
    _descriptionLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_descriptionLabel];
    [self.contentView bringSubviewToFront:_descriptionLabel];
}

-(void)layoutSubviews{
    _imageView.frame = self.contentView.bounds;
    
    _descriptionLabel.frame = CGRectMake(0, self.frame.size.height - 25, self.frame.size.width, 25);
}

@end
