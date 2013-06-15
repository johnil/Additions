//
//  AudioManager.h
//  Additions
//
//  Created by Johnil on 13-5-30.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#define AudioPlayNotification @"audioPaly"
#define AudioPauseNotification @"audioPause"
#define AudioNextNotification @"audioNext"
#define AudioPreNotification @"audioPre"
#define AudioProgressNotification @"audioProgress"


@interface AudioManager : NSObject

/**
 Description: 返回AudioManager的对象
 @return AudioManager唯一对象
 @author johnil
 */
+ (AudioManager *)defaultManager;

/**
 Description: 添加音乐到播放列表
 @param 音乐URL
 @author johnil
 */
- (void)addAudioToList:(NSString *)url;

/**
 Description: 添加音乐URL数组到播放列表
 @param URL数组 @[@"url1", @"url2", ...]
 @author johnil
 */
- (void)addAudioListToList:(NSArray *)arr;

/**
 Description: 插入音乐到播放列表第一首
 @param 音乐URL
 @author johnil
 */
- (void)insertAudioToList:(NSString *)name;

/**
 Description: 插入音乐URL数组到播放列表表首
 @param URL数组 @[@"url1", @"url2", ...]
 @author johnil
 */
- (void)insertAudioListToList:(NSArray *)arr;

/**
 Description: 清除播放列表
 @author johnil
 */
- (void)clearAudioList;

/**
 Description: 当前播放列表是否为空
 @return 当前播放列表需要一个URL开始播放
 @author johnil
 */
- (BOOL)needURL;

/**
 Description: 修改当前音乐状态,如果为播放则暂停,否则继续播放.
 @return 如果开始播放,则返回YES,否则返回NO
 @author johnil
 */
- (BOOL)changeStat;

/**
 Description: 当前音乐播放状态
 @return MPMoviePlaybackState 对应状态
 @author johnil
 */
- (MPMoviePlaybackState)stat;

/**
 Description: 在线播放URL
 @param 音乐URL
 @author johnil
 */
- (void)playWithURL:(NSString *)url;

/**
 Description: 继续播放音乐
 @author johnil
 */
- (void)resume;

/**
 Description: 暂停音乐
 @author johnil
 */
- (void)pause;

/**
 Description: 播放下一首音乐,如果没有下一首则会从第一首开始播放
 @author johnil
 */
- (void)next;

/**
 Description: 播放上一首音乐,如果没有上一首则会从最后一首开始播放
 @author johnil
 */
- (void)pre;

/**
 Description: 将当前播放的音乐跳到x%的位置,对应slider拖动时间条
 @param 时间百分比
 @author johnil
 */
- (void)skipTo:(float)percentage;

/**
 Description: 当前音乐的时间总长
 @return 时间总长
 @author johnil
 */
- (float)duration;

/**
 Description: 当前音乐播放时间
 @return 播放时间
 @author johnil
 */
- (float)currentPlaybackTime;

/**
 Description: 音乐播放列表是否有下一首
 @return 是否
 @author johnil
 */
- (BOOL)hasNext;

/**
 Description: 音乐播放列表是否有上一首
 @return 是否
 @author johnil
 */
- (BOOL)hasPre;

/**
 Description: 从列表第一首开始播放音乐
 @author johnil
 */
- (void)playListAtFirst;

/**
 Description: 当前播放的音乐是播放列表的第几首
 @return 第x首
 @author johnil
 */
- (int)currentIndex;

/**
 Description: 播放当前播放列表的第index首
 @param 要播放的下标
 @author johnil
 */
- (void)playIndex:(int)index;

/**
 Description: 是否在播放
 @return 是否
 @author johnil
 */
- (BOOL)playing;

/**
 Description: 当前播放进度
 @return 进度 0 到 1
 @author johnil
 */
- (float)progress;

/**
 Description: 设置锁屏时音乐封面
 @param 封面图片
 @param 名称
 @param 歌手
 @author johnil
 */

- (void)setMediaInfo:(UIImage *)img andTitle:(NSString *)title andArtist:(NSString *)artist;


@end
