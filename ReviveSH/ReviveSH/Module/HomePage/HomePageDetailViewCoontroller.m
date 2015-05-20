//
//  HomePageDetailViewCoontroller.m
//  ReviveSH
//
//  Created by zhb on 15/5/19.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailViewCoontroller.h"
#import "ImagePlayerView.h"

@interface HomePageDetailViewCoontroller()<ImagePlayerViewDelegate>

@property (nonatomic,strong) UIScrollView *contentScrollView;

@property (nonatomic,strong) ImagePlayerView *imagePlayerView;

@end

@implementation HomePageDetailViewCoontroller

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0x1D1D1D);
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.contentScrollView];
    [self.contentScrollView addSubview:self.imagePlayerView];
}

#pragma mark getter & setter
-(UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _contentScrollView.backgroundColor = [UIColor clearColor];
    }
    return _contentScrollView;
}

-(ImagePlayerView *)imagePlayerView{
    if (!_imagePlayerView) {
        NSArray *urlArray = @[@"http://ww1.sinaimg.cn/bmiddle/70e85378jw1dsxriz44iuj.jpg",
                              @"http://ww2.sinaimg.cn/bmiddle/70e85378jw1ds8g2gtot8j.jpg",
                              @"http://ww2.sinaimg.cn/large/5f5d4271gw1dt1i8rf47aj.jpg",
                              @"http://ww4.sinaimg.cn/bmiddle/70e85378jw1dr57belktxj.jpg",
                              @"http://ww3.sinaimg.cn/bmiddle/70e85378jw1drayzoda5dj.jpg"];
        _imagePlayerView = [[ImagePlayerView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)];
        _imagePlayerView.scrollInterval = 3.0f;
        [_imagePlayerView initWithImageURLs:urlArray placeholder:nil delegate:self];
    }
    return _imagePlayerView;
}

@end
