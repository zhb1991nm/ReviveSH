//
//  UILabel+AttributedString.m
//  ReviveSH
//
//  Created by zhb on 15/5/23.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "UILabel+AttributedString.h"

@implementation UILabel (AttributedString)

-(void)setText:(NSString *)text withLineSpacing:(CGFloat)lineSpacing{
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:lineSpacing];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [text length])];
    [self setAttributedText:attributedString1];
}

+(CGFloat)fixHeightWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font width:(CGFloat)width{
    NSMutableAttributedString* attributedString1 = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:lineSpacing];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [text length])];
    NSRange range = NSMakeRange(0, attributedString1.length);
    NSDictionary* dic = [attributedString1 attributesAtIndex:0 effectiveRange:&range];
    return [text boundingRectWithSize:CGSizeMake(width, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.height;
}

@end
