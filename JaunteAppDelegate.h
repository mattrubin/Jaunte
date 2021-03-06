//
//  JaunteAppDelegate.h
//  Jaunte
//
//  Created by Matt Rubin on 1/11/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TransparentWindow.h"

@interface JaunteAppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem *statusItem;
	IBOutlet NSMenu *statusMenu;
	IBOutlet TransparentWindow *jaunteWindow;
}

- (void)registerHotkey;

- (IBAction)jaunte:(id)sender;
- (void)showJaunteWindow;

@end
