//
//  Student_Info.m
//  Assign2_Pena
//
//  Created by Ivanna Peña on 3/3/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import "Student_Info.h"

@implementation Student_Info

- (id) init{
    if( self = [super init] ){}
    return self;
}

-(void) setAddress:(NSString *) address{ _address = address; }
-(void) setMidterm:(float) grade{ _midterm_exam = grade; }
-(void) setFinal:(float) grade{ _final_exam = grade; }
-(void) setHW1:(int) grade{ _hw1 = grade; }
-(void) setHW2:(int)grade{ _hw2 = grade; }
-(void) setHW3:(int)grade{ _hw3 = grade; }


@end
