//
//  RequestBaseViewController.m
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "RequestBaseViewController.h"

@implementation RequestBaseViewController

-(void)viewDidLoad{
    _requestManager = [NetWorkManager instance];
    [super viewDidLoad];
    [self.view addSubview:_requestAgainButton];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _requestAgainButton.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    _requestAgainButton.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_requestManager) {
        [_requestManager cancalAllRequest];
    }
}

#pragma mark event response
-(IBAction)requestAgain:(UIButton *)sender{
    sender.hidden = YES;
}

#pragma mark getter&setter
-(UIButton *)requestAgainButton{
    if (!_requestAgainButton) {
        _requestAgainButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _requestAgainButton.backgroundColor = [UIColor clearColor];
        [_requestAgainButton setTitle:@"点击刷新" forState:UIControlStateNormal];
        [_requestAgainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _requestAgainButton.hidden = YES;
        [_requestAgainButton addTarget:self action:@selector(requestAgain:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _requestAgainButton;
}

@end
