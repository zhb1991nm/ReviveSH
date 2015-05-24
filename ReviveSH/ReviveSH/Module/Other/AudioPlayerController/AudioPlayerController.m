//
//  AudioPlayerController.m
//  ReviveSH
//
//  Created by zhb on 15/5/23.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "AudioPlayerController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

static AudioPlayerController *sharedInstance;
@interface AudioPlayerController()

@property (nonatomic,strong) MPMoviePlayerController *audioPlayer;

@property (nonatomic,strong) NSTimer *processTimer;

@property (nonatomic,strong) AudioInfoObject *currentAudio;

@property (nonatomic,strong) AudioInfoObject *lastAudio;

@end

@implementation AudioPlayerController

+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

-(void)loadAudio:(AudioInfoObject *)audio{
    if (audio != _currentAudio) {
        _lastAudio = _currentAudio;
        _currentAudio = audio;
    }else{
        return;
    }
}

-(void)play{
    [_audioPlayer setContentURL:[NSURL URLWithString:_currentAudio.url]];
    [_audioPlayer play];
}

-(void)pause{
    [_audioPlayer pause];
}

-(void)stop{
    [_audioPlayer play];
}

#pragma mark Observer
-(void)addObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startPlay)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initSongInfomation)
                                                 name: MPMoviePlayerLoadStateDidChangeNotification
                                               object:nil];
}

#pragma mark timer
-(void)startProcessTimer{
    _processTimer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(processTimerTarget) userInfo:nil repeats:YES];
}

-(void)stopProcessTimer{
    if (_processTimer) {
        [_processTimer invalidate];
    }
}

#pragma event response
-(void)processTimerTarget{
    if (_delegate && [_delegate respondsToSelector:@selector(AudioPlayerController:audio:currentPlaybackTime:currentRate:)]) {
        [_delegate AudioPlayerController:self audio:_currentAudio currentPlaybackTime:_audioPlayer.currentPlaybackTime currentRate:_audioPlayer.currentPlaybackRate];
    }
}

#pragma mark getter & setter
-(MPMoviePlayerController *)audioPlayer{
    if (!_audioPlayer) {
        _audioPlayer = [[MPMoviePlayerController alloc] init];
        
    }
    return _audioPlayer;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

@implementation AudioInfoObject

-(instancetype)initWithUrl:(NSString *)url title:(NSString *)title{
    self = [super init];
    if (self) {
        self.url = url;
        self.title = title;
    }
    return self;
}

@end
