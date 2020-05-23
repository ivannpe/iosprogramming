//
//  drawView.m
//  PaddleGame
//
//  Created by Ivanna Peña on 3/24/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "drawView.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation drawView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIColor *fillColor = [UIColor redColor];
    [fillColor setFill];
    UIColor *strokeColor = [UIColor orangeColor];
    [strokeColor setStroke];
    
    CGFloat radius = rect.size.width/2.0f;

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGPoint centerPoint = CGPointMake(rect.origin.x + radius, rect.origin.y + radius);

    CGPoint thisPoint = CGPointMake(centerPoint.x + radius, centerPoint.y);
    [bezierPath moveToPoint:centerPoint];

    CGFloat thisAngle = 0.0f;
    CGFloat sliceDegrees = 360.0f / 50 / 2.0f;

    for (int i = 0; i < 50; i++) {

        CGFloat x = radius * cosf(DEGREES_TO_RADIANS(thisAngle + sliceDegrees)) + centerPoint.x;
        CGFloat y = radius * sinf(DEGREES_TO_RADIANS(thisAngle + sliceDegrees)) + centerPoint.y;
        thisPoint = CGPointMake(x, y);
        [bezierPath addLineToPoint:thisPoint];
        thisAngle += sliceDegrees;

        CGFloat x2 = radius * cosf(DEGREES_TO_RADIANS(thisAngle + sliceDegrees)) + centerPoint.x;
        CGFloat y2 = radius * sinf(DEGREES_TO_RADIANS(thisAngle + sliceDegrees)) + centerPoint.y;
        thisPoint = CGPointMake(x2, y2);
        [bezierPath addLineToPoint:thisPoint];
        [bezierPath addLineToPoint:centerPoint];
        thisAngle += sliceDegrees;

    }
    [bezierPath closePath];
    bezierPath.lineWidth = 1;
    [bezierPath fill];
    [bezierPath stroke];
}
@end
