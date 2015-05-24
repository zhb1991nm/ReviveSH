//
//  BaseViewController.h
//  Haobo
//
//  Created by 张浩波 on 15/5/7.
//  Copyright (c) 2015年 zhb1991nm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,strong) UIButton *leftNavigationButton;

-(void)viewDidFirstAppear:(BOOL)animated;

-(IBAction)leftNavigationButtonOnClick:(id)sender;

@end
