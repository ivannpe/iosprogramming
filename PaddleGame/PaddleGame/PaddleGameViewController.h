//
//  PaddleGameViewController.h
//  PaddleGame
//
//  Created by Ivanna Peña on 3/24/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface PaddleGameViewController : ViewController
@property CGPoint balldirection, paddledirection;
@property NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreboardLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property NSUserDefaults *scoreNum;

@property NSInteger savedScore;

- (void) handleTimer: (NSTimer *) timer;

@end
NS_ASSUME_NONNULL_END
