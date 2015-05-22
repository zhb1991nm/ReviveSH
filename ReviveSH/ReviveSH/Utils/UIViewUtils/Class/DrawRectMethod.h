//
//  DrawRectMethod.h
//  ReviveSH
//
//  Created by zhb on 15/5/22.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrawRectMethod : NSObject

+ (void)drawLine:(CGContextRef)context startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint lineColor:(UIColor *)lineColor width:(CGFloat)thickness;

@end
