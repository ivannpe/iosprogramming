//
//  Student_Info.h
//  Assign2_Pena
//
//  Created by Ivanna Peña on 3/3/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Student_Info : NSObject

-(id) init;
 

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) float midterm_exam;
@property (nonatomic) float final_exam;
@property (nonatomic) int hw1;
@property (nonatomic) int hw2;
@property (nonatomic) int hw3;
@property (nonatomic) UIImage *img;

-(void) setName: (NSString *) name;
-(void) setAddress:(NSString *) address;
-(void) setMidterm:(float) midterm_exam;
-(void) setFinal:(float) final_exam;
-(void) setHW1:(int) hw1;
-(void) setHW2:(int)hw2;
-(void) setHW3:(int)hw3;
-(void) setImg:(UIImage *) img;


@end
