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
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:[[NSStatusBar systemStatusBar] thickness]] retain];
	NSLog(@"%f\n", [[NSStatusBar systemStatusBar] thickness]);
	//Used to detect where our files are
    NSBundle *bundle = [NSBundle mainBundle];
    
    //Allocates and loads the images into the application which will be used for our NSStatusItem
    NSImage *statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
    
    //Sets the images in our NSStatusItem
    [statusItem setImage:statusImage];
	NSImage *statusHighlightImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"IconHover" ofType:@"png"]];
    
    [statusItem setAlternateImage:statusHighlightImage];
    
	
	
	//Tells the NSStatusItem what menu to load
    [statusItem setMenu:statusMenu];
    //Sets the tooptip for our item
    [statusItem setToolTip:@"Jaunte 0.1"];
    //Enables highlighting
    [statusItem setHighlightMode:YES];
}

@end
