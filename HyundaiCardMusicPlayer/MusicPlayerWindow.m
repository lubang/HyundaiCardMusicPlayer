//
//  MusicPlayerWindow.m
//  HyundaiCardMusicPlayer
//
//  Created by Lubang on 13. 8. 24..
//  Copyright (c) 2013년 Lubang. All rights reserved.
//

#import "MusicPlayerWindow.h"
#import <Carbon/Carbon.h>

@implementation MusicPlayerWindow
{
    enum MusicWindowMode _mode;
    CGPoint _prevOrigin;
}

@synthesize webView;

- (void)awakeFromNib
{
    _mode = MusicWindowNormal;
    [webView setMainFrameURL:@"http://www.hyundaicardmusic.com/"];
}

- (BOOL)windowShouldClose:(NSNotification *)notification
{
	NSLog(@"MusicPlayer Window Hide");
    [[NSApplication sharedApplication] hide:self];
	return NO;
}

- (void)keyDown:(NSEvent *)theEvent
{
    if ([theEvent modifierFlags] & NSCommandKeyMask) {
        switch ([theEvent keyCode]) {
            case kVK_ANSI_1: [self resizeMusicWindow:MusicWindowMini]; break;
            case kVK_ANSI_2: [self resizeMusicWindow:MusicWindowFull]; break;
            case kVK_ANSI_3: [self resizeMusicWindow:MusicWindowNormal]; break;
            default:
                break;
        }
    }
}

- (void)resizeMusicWindow:(enum MusicWindowMode)mode
{
    NSRect curFrame = [self frame];

    NSRect newFrame;
    if (_mode != MusicWindowFull) {
        _prevOrigin = curFrame.origin;
    }
    newFrame.origin.x = _prevOrigin.x;
    newFrame.origin.y = _prevOrigin.y + (curFrame.size.height - 90);
    
    switch (mode) {
        case MusicWindowMini:
            NSLog(@"MusicWindowMini");
            newFrame.size.width = 320;
            newFrame.size.height = 90;
            break;
        case MusicWindowFull:
            NSLog(@"MusicWindowFull");
            newFrame = [[NSScreen mainScreen] visibleFrame];
            break;
        case MusicWindowNormal:
            NSLog(@"MusicWindowNormal");
            newFrame.size.width = 660;
            newFrame.size.height = 500;
            break;
        default:
            NSLog(@"Invalid music window mode = %d", mode);
            break;
    }

    [self setFrame:newFrame display:YES animate:YES];
    _mode = mode;
}

@end
