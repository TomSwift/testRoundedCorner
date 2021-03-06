//
//  TSRoundedCornerView.m
//  testRoundedCorner
//
//  Created by Nicholas Hodapp on 1/30/14.
//  Copyright (c) 2014 Nicholas Hodapp. All rights reserved.
//

#import "TSRoundedCornerView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TSRoundedCornerView

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self TSRoundedCornerView_commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self TSRoundedCornerView_commonInit];
    }
    return self;
}

- (void) TSRoundedCornerView_commonInit
{
    self.userInteractionEnabled = NO;
    self.clipsToBounds = YES;
    self.contentMode = UIViewContentModeRedraw;
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
}

- (void) setBackgroundView:(UIImageView *)backgroundView
{
    [self willChangeValueForKey: @"backgroundView"];
    {
        _backgroundView = backgroundView;
        [self setNeedsDisplay];
    }
    [self didChangeValueForKey: @"backgroundView"];
}

- (void) setCorner:(UIRectCorner)corner
{
    [self willChangeValueForKey: @"backgroundView"];
    {
        _corner = corner;
        [self setNeedsDisplay];
    }
    [self didChangeValueForKey: @"backgroundView"];
}

- (void) drawRect:(CGRect)rect
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(gc);
    {
        // create an inverted clip path
        // (thanks rob mayoff: http://stackoverflow.com/questions/9042725/drawrect-how-do-i-do-an-inverted-clip)
        UIBezierPath* bp = [UIBezierPath bezierPathWithRoundedRect: self.bounds
                                                 byRoundingCorners: self.corner // e.g. UIRectCornerTopLeft
                                                       cornerRadii: self.bounds.size];
        CGContextAddPath(gc, bp.CGPath);
        CGContextAddRect(gc, CGRectInfinite);
        CGContextEOClip(gc);
        
        // self.backgroundView is the view we want to show peering out behind the rounded corner
        // this works well enough if there's only one layer to render and not a view hierarchy!
        [self.backgroundView.layer renderInContext: gc];
        
//$ the iOS7 way of rendering the contents of a view.  It works, but only if the UIImageView has already painted...  I think.
//$ if you try this, be sure to setNeedsDisplay on this view from your view controller's viewDidAppear: method.
//        CGRect r = self.backgroundView.bounds;
//        r.origin = [self.backgroundView convertPoint: CGPointZero toView: self];
//        [self.backgroundView drawViewHierarchyInRect: r
//                                  afterScreenUpdates: YES];
    }
    CGContextRestoreGState(gc);
}

@end
