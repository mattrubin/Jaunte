//
//  RoundedView.m
//  RoundedFloatingPanel
//
//  Created by Matt Gemmell on Thu Jan 08 2004.
//  <http://iratescotsman.com/>
//


#import "RoundedView.h"

@implementation RoundedView


- (void)drawRect:(NSRect)rect
{
	[self drawRoundedRect:self.frame withRadius:12.0 color:[NSColor colorWithCalibratedWhite:0.0 alpha:0.35]];
	[self drawRoundedRect:[self shrinkNSRect:self.frame by:7.0] withRadius:5.0 color:[NSColor colorWithCalibratedWhite:0.98 alpha:1.0]];
}

- (void)drawRoundedRect:(NSRect)rect withRadius:(float)radius color:(NSColor*)color {
    int minX = NSMinX(rect);
    int midX = NSMidX(rect);
    int maxX = NSMaxX(rect);
    int minY = NSMinY(rect);
    int midY = NSMidY(rect);
    int maxY = NSMaxY(rect);
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    // Bottom edge and bottom-right curve
    [path moveToPoint:NSMakePoint(midX, minY)];
    [path appendBezierPathWithArcFromPoint:NSMakePoint(maxX, minY) 
                                     toPoint:NSMakePoint(maxX, midY) 
                                      radius:radius];
    
    // Right edge and top-right curve
    [path appendBezierPathWithArcFromPoint:NSMakePoint(maxX, maxY) 
                                     toPoint:NSMakePoint(midX, maxY) 
                                      radius:radius];
    
    // Top edge and top-left curve
    [path appendBezierPathWithArcFromPoint:NSMakePoint(minX, maxY) 
                                     toPoint:NSMakePoint(minX, midY) 
                                      radius:radius];
    
    // Left edge and bottom-left curve
    [path appendBezierPathWithArcFromPoint:rect.origin 
                                     toPoint:NSMakePoint(midX, minY) 
                                      radius:radius];
    [path closePath];
    
    [color set];
    [path fill];
}

- (NSRect)shrinkNSRect:(NSRect)rect by:(float)dist {
	NSRect r = {rect.origin.x + dist, rect.origin.y + dist, rect.size.width - 2*dist, rect.size.height - 2*dist};
	return r;
}

@end
