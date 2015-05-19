//
//  HomePageDetailViewCoontroller.m
//  ReviveSH
//
//  Created by zhb on 15/5/19.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailViewCoontroller.h"

@interface HomePageDetailViewCoontroller()

@property (nonatomic,strong) UIScrollView *pagedScrollView;

@end

@implementation HomePageDetailViewCoontroller

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:[[UIView alloc] init]];
    [self.view addSubview:self.pagedScrollView];
}

#pragma mark getter & setter
-(UIScrollView *)pagedScrollView{
    if (!_pagedScrollView) {
        _pagedScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 100)];
        _pagedScrollView.pagingEnabled = YES;
        _pagedScrollView.contentSize = CGSizeMake(_pagedScrollView.frame.size.width * 3, _pagedScrollView.frame.size.height);
        CGFloat originX = 0;
        for (int i = 0; i < 3;i++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originX, 0, _pagedScrollView.frame.size.width, _pagedScrollView.frame.size.height)];
            if (i == 0) {
                view.backgroundColor = [UIColor redColor];
            }else if (i == 1){
                view.backgroundColor = [UIColor greenColor];
            }else{
                view.backgroundColor = [UIColor blueColor];
            }
            [_pagedScrollView addSubview:view];
            originX += _pagedScrollView.frame.size.width;
        }
    }
    return _pagedScrollView;
}

@end
