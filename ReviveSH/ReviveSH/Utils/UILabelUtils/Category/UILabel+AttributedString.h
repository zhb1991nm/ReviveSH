//
//  UILabel+AttributedString.h
//  ReviveSH
//
//  Created by zhb on 15/5/23.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AttributedString)

- (void)setText:(NSString *)text withLineSpacing:(CGFloat)lineSpacing;

+ (CGFloat)fixHeightWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font width:(CGFloat)width;

@end
