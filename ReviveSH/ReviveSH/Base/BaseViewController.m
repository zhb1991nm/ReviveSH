//
//  BaseViewController.m
//  Haobo
//
//  Created by 张浩波 on 15/5/7.
//  Copyright (c) 2015年 zhb1991nm. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController()

@property (nonatomic,assign) BOOL firstAppear;

@end

@implementation BaseViewController

#pragma mark - life cycle
-(void)viewDidLoad{
    [super viewDidLoad];
    _firstAppear = YES;
    if(self.navigationController){
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
        self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x171717);
        NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
        if (index > 0 && index != NSNotFound) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftNavigationButton];
        }
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (_firstAppear) {
        _firstAppear = NO;
        [self viewDidFirstAppear:animated];
    }
}

-(void)viewDidFirstAppear:(BOOL)animated{
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

#pragma mark - UITableViewDelegate

#pragma mark - CustomDelegate

#pragma mark - event response

-(IBAction)leftNavigationButtonOnClick:(id)sender{
    if(self.navigationController){
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - private methods

#pragma mark - getters and setters

-(UIButton *)leftNavigationButton{
    if (!_leftNavigationButton) {
        _leftNavigationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _leftNavigationButton.imageEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4);
        [_leftNavigationButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_leftNavigationButton addTarget:self action:@selector(leftNavigationButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        _leftNavigationButton.backgroundColor = [UIColor clearColor];
    }
    return _leftNavigationButton;
}

@end
