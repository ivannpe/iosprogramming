//
//  StudentInfoViewController.m
//  Assign2_Pena
//
//  Created by Ivanna Peña on 3/3/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import "StudentInfoViewController.h"
#import "ViewController.h"
@interface StudentInfoViewController ()
@end

@implementation StudentInfoViewController

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.studentImage setContentMode:UIViewContentModeScaleAspectFit];
   
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController *VC = (ViewController *)self.presentingViewController;
    [VC backToUpdateInfo];
}
@end
