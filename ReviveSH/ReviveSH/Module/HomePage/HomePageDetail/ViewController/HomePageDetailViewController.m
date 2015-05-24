//
//  HomePageDetailViewController.m
//  ReviveSH
//
//  Created by zhb on 15/5/23.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "HomePageDetailViewController.h"
#import "HomePageDetailSummarySectionView.h"
#import "HomePageDetailAudioPlayerView.h"
#import "HomePageDetailAudioPlayerCell.h"
#import "HomePageDetailConstants.h"
#import "ImagePlayerView.h"
#import "AudioPlayerController.h"
#import "HomePageDetailViewController+Request.h"

@interface HomePageDetailViewController ()<ImagePlayerViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) ImagePlayerView *imagePlayerView;

@property (nonatomic,strong) HomePageDetailSummarySectionView *summaryView;

@property (nonatomic,strong) HomePageDetailAudioPlayerView *playerView;

@property (nonatomic,strong) NSMutableArray *imageUrlArray;

@property (nonatomic,strong) NSMutableArray *audioArray;

@property (nonatomic,weak) HomePageDetailViewController *weakSelf;

@property (nonatomic,strong) HomePageViewSpotDetailEntity *viewSpotDetail;

@end

@implementation HomePageDetailViewController

#pragma mark life cycle
-(void)viewDidLoad{
    [super viewDidLoad];
    _weakSelf = self;
    self.view.backgroundColor = HomePageDetailBackgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.playerView.playerTableView.allowsSelection = NO;
    [self requestData];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.imagePlayerView.frame = CGRectMake(0, 64, self.view.frame.size.width, HomePageDetailImagePlayerViewHeight);
    self.summaryView.frame = CGRectMake(HomePageDetailSectionMargin, CGRectGetMaxY(self.imagePlayerView.frame) + HomePageDetailSectionMargin, HomePageDetailSectionWidth, HomePageDetailSummaryViewHeight);
    self.playerView.frame = CGRectMake(HomePageDetailSectionMargin, CGRectGetMaxY(self.summaryView.frame) + HomePageDetailSectionMargin, HomePageDetailSectionWidth, HomePageDetailAudioPlayerViewHeight);
}
#pragma mark UITableViewDelegate & UITableViewDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return HomePageDetailAudioPlayerCellHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _audioArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"PlayerCell";
    HomePageDetailAudioPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomePageDetailAudioPlayerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    HomePageViewSpotDetailVoiceEntity *voiceEntity = self.viewSpotDetail.voices[indexPath.row];
    cell.originTitleLabel.text = voiceEntity.name;
    [cell.laudButton setTitle:voiceEntity.likes.stringValue forState:UIControlStateNormal];
    cell.likes = voiceEntity.likes.integerValue;
    return cell;
}

#pragma mark event response
-(IBAction)requestAgain:(UIButton *)sender{
    [super requestAgain:sender];
    [self requestData];
}

#pragma mark network
-(void)requestData{
    [self queryViewSpotDetailSuccess:^(HomePageViewSpotDetailEntity *viewSpotDetail) {
        _weakSelf.viewSpotDetail = viewSpotDetail;
        [_weakSelf.view addSubview:_weakSelf.imagePlayerView];
        [_weakSelf.view addSubview:_weakSelf.summaryView];
        [_weakSelf.view addSubview:_weakSelf.playerView];
        _weakSelf.summaryView.summaryLabel.text = viewSpotDetail.introduce;
        [_weakSelf.summaryView.locationButton setTitle:viewSpotDetail.address forState:UIControlStateNormal];
        [_weakSelf.summaryView.locationButton setImage:[UIImage imageNamed:@"map-icon"] forState:UIControlStateNormal];
        _weakSelf.playerView.playerTableView.delegate = self;
        _weakSelf.playerView.playerTableView.dataSource = self;
        _weakSelf.imageUrlArray = [NSMutableArray array];
        for (HomePageViewSpotDetailPictureEntity *picture in viewSpotDetail.pictures) {
            [_weakSelf.imageUrlArray addObject:picture.url];
        }
        [_weakSelf.imagePlayerView initWithImageURLs:_weakSelf.imageUrlArray placeholder:nil delegate:self];
        _weakSelf.audioArray = [NSMutableArray array];
        for (HomePageViewSpotDetailVoiceEntity *voice in viewSpotDetail.voices) {
            AudioInfoObject *audio = [[AudioInfoObject alloc] initWithUrl:voice.url title:voice.name];
            [_weakSelf.audioArray addObject:audio];
        }
        [_weakSelf.playerView.playerTableView reloadData];
        
    } failure:^(NSError *error) {
        _weakSelf.requestAgainButton.hidden = NO;
        [_weakSelf.view bringSubviewToFront:_weakSelf.requestAgainButton];
    }];
}

#pragma mark getter & setter
-(ImagePlayerView *)imagePlayerView{
    if (!_imagePlayerView) {
        
        _imagePlayerView = [[ImagePlayerView alloc] init];
        _imagePlayerView.scrollInterval = 5.0f;
        
    }
    return _imagePlayerView;
}

-(HomePageDetailSummarySectionView *)summaryView{
    if (!_summaryView) {
        _summaryView = [[HomePageDetailSummarySectionView alloc] init];
        _summaryView.titleLabel.text = @"简介";
        _summaryView.layer.cornerRadius = HomePageDetailSectionCornerRadius;
        
    }
    return _summaryView;
}

-(HomePageDetailAudioPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [[HomePageDetailAudioPlayerView alloc] init];
        _playerView.titleLabel.text = @"听听故事";
        _playerView.layer.cornerRadius = HomePageDetailSectionCornerRadius;
    }
    return _playerView;
}

@end
