//
//  RoundedView.h
//  RoundedFloatingPanel
//
//  Created by Matt Gemmell on Thu Jan 08 2004.
//  <http://iratescotsman.com/>
//


#import <Cocoa/Cocoa.h>

@interface RoundedView : NSView
{
}
- (void)drawRoundedRect:(NSRect)rect withRadius:(float)radius color:(NSColor*)color;
- (NSRect)shrinkNSRect:(NSRect)rect by:(float)dist;

@end
