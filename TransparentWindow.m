//
//  TransparentWindow.m
//  Jaunte
//
//  Created by Matt Rubin on 1/11/11.
//  Copyright 2011. All rights reserved.
//

#import "TransparentWindow.h"
//#import <AppKit/NSMenuView.h>

@implementation TransparentWindow

- (id)initWithContentRect:(NSRect)contentRect 
                styleMask:(NSUInteger)aStyle 
                  backing:(NSBackingStoreType)bufferingType 
                    defer:(BOOL)flag {
    
    if (self = [super initWithContentRect:contentRect 
								styleMask:NSBorderlessWindowMask 
								  backing:NSBackingStoreBuffered 
									defer:NO]) {
        [self setLevel: NSStatusWindowLevel];
        [self setBackgroundColor: [NSColor clearColor]];
        [self setAlphaValue:1.0];
        [self setOpaque:NO];
        [self setHasShadow:YES];
        
        return self;
    }
    
    return nil;
}

- (BOOL) canBecomeKeyWindow
{
    return YES;
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint currentLocation;
    NSPoint newOrigin;
//    NSRect  screenFrame = [[NSScreen mainScreen] frame];
//    NSRect  windowFrame = [self frame];
    
    currentLocation = [self convertBaseToScreen:[self mouseLocationOutsideOfEventStream]];
    newOrigin.x = currentLocation.x - initialLocation.x;
    newOrigin.y = currentLocation.y - initialLocation.y;
    
//    if( (newOrigin.y + windowFrame.size.height) > (NSMaxY(screenFrame) - [NSMenuView menuBarHeight]) ){
        // Prevent dragging into the menu bar area
//		newOrigin.y = NSMaxY(screenFrame) - windowFrame.size.height - [NSMenuView menuBarHeight];
//    }
    /*
	 if (newOrigin.y < NSMinY(screenFrame)) {
	 // Prevent dragging off bottom of screen
	 newOrigin.y = NSMinY(screenFrame);
	 }
	 if (newOrigin.x < NSMinX(screenFrame)) {
	 // Prevent dragging off left of screen
	 newOrigin.x = NSMinX(screenFrame);
	 }
	 if (newOrigin.x > NSMaxX(screenFrame) - windowFrame.size.width) {
	 // Prevent dragging off right of screen
	 newOrigin.x = NSMaxX(screenFrame) - windowFrame.size.width;
	 }
	 */
    
    [self setFrameOrigin:newOrigin];
}


- (void)mouseDown:(NSEvent *)theEvent
{    
    NSRect windowFrame = [self frame];
    
    // Get mouse location in global coordinates
    initialLocation = [self convertBaseToScreen:[theEvent locationInWindow]];
    initialLocation.x -= windowFrame.origin.x;
    initialLocation.y -= windowFrame.origin.y;
}




@end
