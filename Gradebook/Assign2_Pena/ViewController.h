//
//  ViewController.h
//  Assign2_Pena
//
//  Created by Ivanna Peña on 3/3/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSMutableArray *studentArray;

- (void) backToUpdateInfo;

- (void) showStudentAtIndex:(int) index;

- (BOOL) canAddStudent: (NSString *) name
               address: (NSString *) address
          midterm_exam: (NSString *) midterm_exam
            final_exam: (NSString *) final_exam
                   hw1: (NSString *) hw1
                   hw2: (NSString *) hw2
                   hw3: (NSString *) hw3;

@end

