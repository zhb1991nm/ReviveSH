//
//  DrawRectMethod.m
//  ReviveSH
//
//  Created by zhb on 15/5/22.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "DrawRectMethod.h"

@implementation DrawRectMethod

+ (void)drawLine:(CGContextRef)context startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineColor:(UIColor *)lineColor width:(CGFloat)thickness{
    CGContextSetShouldAntialias(context, YES ); //抗锯齿
    CGColorSpaceRef linecolorspace = CGColorSpaceCreateDeviceRGB();
    CGContextSetStrokeColorSpace(context, linecolorspace);
    CGContextSetLineWidth(context, thickness);
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    CGContextStrokePath(context);
    CGColorSpaceRelease(linecolorspace);
}

@end
