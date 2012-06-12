//
//  DMCoverControlView.m
//  diumoo-main-ui
//
//  Created by Shanzi on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DMCoverControlView.h"

@implementation DMCoverControlView
@synthesize slide,volumeControl;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        slide = [DMCoverSlide new];
        volumeControl = [[DMVolumeControlLayer alloc] initWithVolume:1.0];
        rootLayer = [CALayer new];
        
        rootLayer.anchorPoint = CGPointMake(0, 0);
        slide.anchorPoint = rootLayer.anchorPoint;
        
        
        rootLayer.bounds = bounds;
        rootLayer.position = rootLayer.anchorPoint;
        rootLayer.backgroundColor = CGColorCreateGenericGray(1.0, 1.0);
        
        rootLayer.borderWidth = 1.0;
        rootLayer.borderColor = CGColorCreateGenericGray(0.8, 1.0);
        
        slide.position = rootLayer.position;
        
        volumeControl.anchorPoint = rootLayer.anchorPoint;
        volumeControl.position = CGPointMake(0,
            rootLayer.bounds.size.height - volumeControl.bounds.size.height - 2.0);
        
        slide.opacity = 0;
        volumeControl.opacity = 0;
        
        [rootLayer addSublayer:slide];
        [rootLayer addSublayer:volumeControl];
        
        [self setWantsLayer:YES];
        [self setLayer:rootLayer];
        
        [self addTrackingRect:bounds owner:self userData:NULL assumeInside:NO];
    }
    
    return self;
}

-(BOOL) acceptsFirstResponder
{
    return YES;
}

-(void) mouseEntered:(NSEvent *)event
{
    volumeControl.opacity = 1.0;
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    slide.backCover.opacity = 1.0;
    [CATransaction commit];
    
}

-(void) mouseExited:(NSEvent *)event
{
    volumeControl.opacity = 0;
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    slide.backCover.opacity = 0;
    [CATransaction commit];
}


-(void) mouseUp:(NSEvent *)event
{
    CGPoint point = [self convertPoint:[event locationInWindow] fromView:nil];
    id layer = [rootLayer hitTest:point];
    
    if(layer == volumeControl){
        
    }
    else if(layer == slide.backCover){
        
    }
    else if(layer == slide.frontCover){
        
    }
}

@end
