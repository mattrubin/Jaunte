//
//  JaunteAppDelegate.h
//  Jaunte
//
//  Created by Matt Rubin on 1/11/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JaunteAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
