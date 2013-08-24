//
//  MusicPlayerWindow.h
//  HyundaiCardMusicPlayer
//
//  Created by Lubang on 13. 8. 24..
//  Copyright (c) 2013년 Lubang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface MusicPlayerWindow : NSWindow

@property (strong) IBOutlet WebView *webView;

enum MusicWindowMode {
    MusicWindowNormal,
    MusicWindowMini,
    MusicWindowFull
};

@end
