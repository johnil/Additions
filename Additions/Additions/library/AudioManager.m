//
//  AudioManager.m
//  Additions
//
//  Created by Johnil on 13-5-30.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "AudioManager.h"
#import <AVFoundation/AVFoundation.h>

static AudioManager *sSharedInstance;

@implementation AudioManager {
    MPMoviePlayerController *player;
    NSMutableArray *playList;
    int currentIndex;
    NSTimer *ticker;
    NSString *tempURL;
}

+ (AudioManager *)defaultManager{
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[AudioManager alloc] init];
    });
    return sSharedInstance;
}

- (id)init{
    self = [super init];
    if (self) {
        currentIndex = -1;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        player = [[MPMoviePlayerController alloc] init];
        player.movieSourceType = MPMovieSourceTypeStreaming;
        playList = [[NSMutableArray alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(audiofinished:) name:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey object:nil];
    }
    return self;
}

- (void)startTick{
    [self stopTick];
    ticker = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:ticker forMode:NSRunLoopCommonModes];
    [[NSNotificationCenter defaultCenter] postNotificationName:AudioPlayNotification object:nil];
}

- (void)stopTick{
    if (ticker) {
        [ticker invalidate];
        ticker = nil;
        [[NSNotificationCenter defaultCenter] postNotificationName:AudioPauseNotification object:nil];
    }
}

- (float)progress{
    float currentTime = player.currentPlaybackTime;
    float total = player.duration;
    return currentTime/total;
}

- (void)tick{
    [[NSNotificationCenter defaultCenter] postNotificationName:AudioProgressNotification object:[NSNumber numberWithFloat:[self progress]]];
}

- (void)playWithURL:(NSString *)url{
    [[NSNotificationCenter defaultCenter] postNotificationName:AudioProgressNotification object:[NSNumber numberWithFloat:0]];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [player setContentURL:[NSURL URLWithString:url]];
    [player play];
    [self startTick];
    tempURL = [url copy];
}

- (BOOL)needURL{
    return !tempURL;
}

- (void)audiofinished:(NSNotification *)notification{
    if (notification==nil) {
        [[NSNotificationCenter defaultCenter] postNotificationName:AudioProgressNotification object:[NSNumber numberWithFloat:1]];
        tempURL = nil;
        [self stopTick];
        [self next];
    }
    int reason = [[[notification userInfo] valueForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue];
    if (reason == MPMovieFinishReasonPlaybackEnded) {
        [[NSNotificationCenter defaultCenter] postNotificationName:AudioProgressNotification object:[NSNumber numberWithFloat:1]];
        tempURL = nil;
        [self stopTick];
        [self next];
    }
}

- (void)setMediaInfo:(UIImage *)img andTitle:(NSString *)title andArtist:(NSString *)artist{
    if (NSClassFromString(@"MPNowPlayingInfoCenter")) {
        NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
        [dict setObject:title forKey:MPMediaItemPropertyAlbumTitle];
        [dict setObject:artist forKey:MPMediaItemPropertyArtist];
        [dict setObject:[NSNumber numberWithFloat:player.currentPlaybackTime] forKey:MPMediaItemPropertyPlaybackDuration];
        
        MPMediaItemArtwork * mArt = [[MPMediaItemArtwork alloc] initWithImage:img];
        [dict setObject:mArt forKey:MPMediaItemPropertyArtwork];
        [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = nil;
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
    }
}

- (BOOL)changeStat{
    if (player.playbackState == MPMoviePlaybackStatePlaying) {
        [player pause];
        [self stopTick];
        return NO;
    } else {
        [player play];
        [self startTick];
        return YES;
    }
}

- (MPMoviePlaybackState)stat{
    return player.playbackState;
}

- (void)resume{
    if (ticker==nil) {
        [player play];
        [self startTick];
    }
}

- (void)pause{
    if (player.playbackState == MPMoviePlaybackStatePlaying) {
        [player pause];
        [self stopTick];
    }
}

- (void)next{
    if (playList.count<=0) {
        return;
    }
    ++currentIndex;
    if (currentIndex>playList.count-1) {
        currentIndex = 0;
    }
    NSLog(@"next play index:%d", currentIndex);
    NSString *url = [playList objectAtIndex:currentIndex];
    [self playWithURL:url];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:AudioNextNotification object:nil];
}

- (void)pre{
    if (playList.count<=0) {
        return;
    }
    --currentIndex;
    if (currentIndex<0) {
        currentIndex = playList.count-1;
    }
    NSLog(@"pre play index:%d", currentIndex);
    [self playWithURL:[playList objectAtIndex:currentIndex]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:AudioPreNotification object:nil];
}

- (void)addAudioToList:(NSString *)url{
    [playList addObject:url];
}

- (void)addAudioListToList:(NSArray *)arr{
    [playList addObjectsFromArray:arr];
}

- (void)insertAudioToList:(NSString *)name{
    [playList insertObject:name atIndex:0];
}

- (void)insertAudioListToList:(NSArray *)arr{
    for (int i=arr.count-1; i>=0; i--) {
        NSString *name = [arr objectAtIndex:i];
        [playList insertObject:name atIndex:0];
    }
}

- (void)clearAudioList{
    [player stop];
    currentIndex = -1;
    tempURL = nil;
    [self stopTick];
    [playList removeAllObjects];
}

- (void)skipTo:(float)percentage{
    if (percentage >= 1) {
        [self audiofinished:nil];
        return;
    }
    float total = player.duration;
    [[NSNotificationCenter defaultCenter] postNotificationName:AudioProgressNotification object:[NSNumber numberWithFloat:total*percentage]];
    [player setCurrentPlaybackTime:total*percentage];
}

- (float)duration{
    return player.duration;
}

- (float)currentPlaybackTime{
    return player.currentPlaybackTime;
    
}

- (BOOL)hasNext{
    return currentIndex<playList.count;
}

- (BOOL)hasPre{
    return currentIndex>0;
}

- (void)playListAtFirst{
    currentIndex = 0;
    if (playList.count>0) {
        [self playWithURL:[playList objectAtIndex:currentIndex]];
    }
}

- (int)currentIndex{
    return currentIndex;
}

- (void)playIndex:(int)index{
    currentIndex = index;
    [self playWithURL:[playList objectAtIndex:currentIndex]];
}

- (BOOL)playing{
    return (player.playbackState!=MPMoviePlaybackStatePaused && player.playbackState!=MPMoviePlaybackStateStopped && player.playbackState!=MPMoviePlaybackStateInterrupted);
}

@end
