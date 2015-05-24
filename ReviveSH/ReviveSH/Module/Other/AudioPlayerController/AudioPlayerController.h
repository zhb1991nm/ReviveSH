//
//  AudioPlayerController.h
//  ReviveSH
//
//  Created by zhb on 15/5/23.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AudioInfoObject;
@protocol AudioPlayerControllerDeleaget;

@interface AudioPlayerController : NSObject

@property (nonatomic,weak) id<AudioPlayerControllerDeleaget> delegate;

+(instancetype)sharedInstance;


-(void)loadAudio:(AudioInfoObject *)audio;
-(void)play;
-(void)pause;
-(void)stop;

@end

@protocol AudioPlayerControllerDeleaget <NSObject>

-(void)AudioPlayerController:(AudioPlayerController *)audioPlayerController didFinshPlaying:(AudioInfoObject *)audio;

-(void)AudioPlayerController:(AudioPlayerController *)audioPlayerController didStartPlaying:(AudioInfoObject *)audio;

-(void)AudioPlayerController:(AudioPlayerController *)audioPlayerController audio:(AudioInfoObject *)audio currentPlaybackTime:(NSTimeInterval)currentPlaybackTime currentRate:(CGFloat)rate;

@end

typedef enum : NSUInteger {
    AudioInfoObjectStatusStop,
    AudioInfoObjectStatusPlay,
    AudioInfoObjectStatusPause
} AudioInfoObjectStatus;

@interface AudioInfoObject : NSObject

-(instancetype)initWithUrl:(NSString *)url title:(NSString *)title;

@property (nonatomic,copy) NSString *url;

@property (nonatomic,copy) NSString *title;

@end
