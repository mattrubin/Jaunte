//
//  JaunteAppDelegate.m
//  Jaunte
//
//  Created by Matt Rubin on 1/11/11.
//  Copyright 2011 Stanford University. All rights reserved.
//

#import "JaunteAppDelegate.h"

@implementation JaunteAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	//[[NSStatusBar systemStatusBar] thickness]
    //Allocates and loads the images into the application which will be used for our NSStatusItem
    NSImage *statusImage = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MenuIcon" ofType:@"png"]];
	NSImage *statusHighlightImage = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IconHover" ofType:@"png"]];
    
    //Sets the images in our NSStatusItem
    [statusItem setImage:statusImage];
    [statusItem setAlternateImage:statusHighlightImage];
	
	[statusImage release];
	[statusHighlightImage release];
	
	//Tells the NSStatusItem what menu to load
    [statusItem setMenu:statusMenu];
    //Enables highlighting
    [statusItem setHighlightMode:YES];
	
	
	//Show the Jaunt window at launch?
	[self showJaunteWindow];
}



- (void)showJaunteWindow {
	// TODO: clear text box and prepare for new Jaunt
	[jaunteWindow center];
	[jaunteWindow makeKeyAndOrderFront:self];
}

- (IBAction)jaunte:(id)sender {
	NSLog(@"Jaunting...\n");
	if([[NSApplication sharedApplication] isActive]){
		if([jaunteWindow isKeyWindow]) {
			// TODO: if another window is open in Jaunte, hide the jaunteWindow instead of the app
			//[jaunteWindow orderOut:self];
			[NSApp hide:self];
		} else {
			[self showJaunteWindow];
		}
	} else {
		[[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
		[self showJaunteWindow];
	}
}

@end
