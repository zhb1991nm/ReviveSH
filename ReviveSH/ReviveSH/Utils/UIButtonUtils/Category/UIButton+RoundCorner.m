//
//  UIButton+RoundCorner.m
//  BrokerMarkerIOS
//
//  Created by icode on 14-9-23.
//  Copyright (c) 2014年 sinitek. All rights reserved.
//

#import "UIButton+RoundCorner.h"

@implementation UIButton (RoundCorner)

-(void)cornerd:(UIRectCorner)corners radius:(CGFloat)radius{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}

@end
