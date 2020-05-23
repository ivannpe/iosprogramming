//
//  ViewController.m
//  Assign2_Pena
//
//  Created by Ivanna Peña on 3/3/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import "ViewController.h"
#import "StudentInfoViewController.h"
#import "Student_Info.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressLabel;
@property (weak, nonatomic) IBOutlet UITextField *midtermLabel;
@property (weak, nonatomic) IBOutlet UITextField *finalLabel;
@property (weak, nonatomic) IBOutlet UITextField *hw1Label;
@property (weak, nonatomic) IBOutlet UITextField *hw2Label;
@property (weak, nonatomic) IBOutlet UITextField *hw3Label;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlButton;
@property (weak, nonatomic) IBOutlet UIButton *addStudentButton;

@end

int idx = 0;
@implementation ViewController
//checks if all fields have been filled
- (BOOL) canAddStudent:(NSString *)name address:(NSString *)address midterm_exam:(NSString *)midterm_exam final_exam:(NSString *)final_exam hw1:(NSString *)hw1 hw2:(NSString *)hw2 hw3:(NSString *)hw3{
    //throws an error if a field to add student is empty
    if([name isEqualToString:@""] || [address isEqualToString:@""] || [midterm_exam isEqualToString:@""] || [final_exam isEqualToString:@""] || [hw1 isEqualToString:@""] || [hw2 isEqualToString:@""] || [hw3 isEqualToString:@""]){
        return NO;
    }
    return YES;
}

- (IBAction)Add_Student:(id)sender {
    //if all values are filled
    if([self canAddStudent:_nameLabel.text address:_addressLabel.text midterm_exam:_midtermLabel.text final_exam:_finalLabel.text hw1:_hw1Label.text hw2:_hw2Label.text hw3:_hw3Label.text]){
        //instantiates new array
        Student_Info *newStudent = [[Student_Info new] init];
        UIImage *image = [UIImage imageNamed:@"blank.png"];
        newStudent.name = _nameLabel.text;
        newStudent.address = _addressLabel.text;
        //gets int and float value from NSString
        newStudent.midterm_exam = _midtermLabel.text.floatValue;
        newStudent.final_exam = _finalLabel.text.floatValue;
        newStudent.hw1 = _hw1Label.text.intValue;
        newStudent.hw2 = _hw2Label.text.intValue;
        newStudent.hw3 = _hw3Label.text.intValue;
        //sets image to blank.png
        [newStudent setImg:image];
        //adds student to array
        [_studentArray addObject:newStudent];
        [_segmentedControlButton setSelectedSegmentIndex:0];
        //version of the first view should indicate its function to the user by setting a label and/or changing the background color.
        //changes background color while keeping fields highlighted
        self.view.backgroundColor = [UIColor redColor];
        [_addStudentButton setAlpha:0];
        [_prevButton setAlpha:1];
        [_nextButton setAlpha:1];
    }else{
        [_addStudentButton setAlpha: 1];
        
    }
    
}
//if update info segment is selected
- (void) backToUpdateInfo{
    [_segmentedControlButton setSelectedSegmentIndex:0];
}
//when loaded
- (void)viewDidLoad {
    [super viewDidLoad];
    [_addStudentButton setAlpha:0];
    [_segmentedControlButton setSelectedSegmentIndex:0];
    //initiates array
    self.studentArray = [[NSMutableArray new] init];
    //create all student objects
    Student_Info *student1 = [[Student_Info new] init];
    UIImage *image = [UIImage imageNamed:@"richard.png"];
    [student1 setName:@"King Richard III"];
    [student1 setAddress:@"Leicester Castle, England"];
    [student1 setMidterm:72];
    [student1 setFinal:45];
    [student1 setHW1:9];
    [student1 setHW2:10];
    [student1 setHw3:00];
    [student1 setImg:image];
    [_studentArray addObject:student1];


    Student_Info *student2 = [[Student_Info new] init];
    image = [UIImage imageNamed:@"younghamlet.png"];
    [student2 setName:@"Prince Hamlet"];
    [student2 setAddress:@"Elsinor Castle, Denmark"];
    [student2 setMidterm:100];
    [student2 setFinal:0];
    [student2 setHW1:10];
    [student2 setHW2:10];
    [student2 setHw3:10];
    [student2 setImg:image];
    [_studentArray addObject:student2];


    Student_Info *student3 = [[Student_Info new] init];
    image = [UIImage imageNamed:@"lear.png"];
    [student3 setName:@"King Lear"];
    [student3 setAddress:@"Leicester Castle, England"];
    [student3 setMidterm:100];
    [student3 setFinal:22];
    [student3 setHW1:10];
    [student3 setHW2:6];
    [student3 setHw3:0];
    [student3 setImg:image];
    [_studentArray addObject:student3];

    Student_Info *student4 = [[Student_Info new] init];
    image = [UIImage imageNamed:@"henry8.png"];
    [student4 setName:@"King Henry VIII"];
    [student4 setAddress:@"Whitehall Palace, England"];
    [student4 setMidterm:62];
    [student4 setFinal:60];
    [student4 setHW1:7];
    [student4 setHW2:6];
    [student4 setHw3:7];
    [student4 setImg:image];
    [_studentArray addObject:student4];

    Student_Info *student5 = [[Student_Info new] init];
    image = [UIImage imageNamed:@"elizabeth.png"];
    [student5 setName:@"Queen Elizabeth"];
    [student5 setAddress:@"Richmond Palace, England"];
    [student5 setMidterm:90];
    [student5 setFinal:100];
    [student5 setHW1:9];
    [student5 setHW2:10];
    [student5 setHw3:10];
    [student5 setImg:image];
    [_studentArray addObject:student5];
    //display student at index given by next and prev button
    [self showStudentAtIndex:idx];
}
//when back button is pressed, reset to original screen
- (IBAction)backHome:(UIStoryboardSegue *)segue{
    [_segmentedControlButton setSelectedSegmentIndex:0];
    [_addStudentButton setAlpha:0];
    if(idx == 0){
        [_prevButton setEnabled:NO];
        [_nextButton setEnabled:YES];
    }else if(idx == _studentArray.count - 1){
        [_prevButton setEnabled:YES];
        [_nextButton setEnabled:NO];
    }else{
        [_prevButton setAlpha:1];
        [_nextButton setAlpha:1];
        [_prevButton setEnabled:YES];
        [_nextButton setEnabled:YES];
    }
}
//checks selected segment in segment control
- (IBAction)selectedSegment:(id)sender {
     if(_segmentedControlButton.selectedSegmentIndex == 0){
         [_addStudentButton setAlpha:0];
         [_nextButton setAlpha:1];
         [_prevButton setAlpha:1];
         self.view.backgroundColor = [UIColor whiteColor];
    }else if(_segmentedControlButton.selectedSegmentIndex == 1){
         StudentInfoViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"studentInfoView"];
         [self showViewController:controller sender:NULL];
         Student_Info *curr = [_studentArray objectAtIndex:idx];
         [controller.studentName setText:curr.name];
         [controller.studentAddress setText:curr.address];
         [controller.studentImage setImage:curr.img];
     }else if(_segmentedControlButton.selectedSegmentIndex == 2){
         [_addStudentButton setAlpha:1];
         [_nextButton setAlpha:0];
         [_prevButton setAlpha:0];
         self.view.backgroundColor = [UIColor redColor];
         _nameLabel.text = @"";
         _addressLabel.text = @"";
         _midtermLabel.text = @"";
         _finalLabel.text = @"";
         _hw1Label.text = @"";
         _hw2Label.text=@"";
         _hw3Label.text=@"";
    }
}
//if back button pressed
- (IBAction)getPrevStudent:(id)sender {
    idx = (idx - 1) % _studentArray.count;
    [self showStudentAtIndex:idx];
}
//if next button pressed
- (IBAction)getNextStudent:(id)sender {
    idx = (idx + 1) % _studentArray.count;
    [self showStudentAtIndex:idx];
}
//ensure to show correct student at right index in the array
- (void) showStudentAtIndex:(int)index{
    if(_studentArray.count == 1){
        [_nextButton setEnabled:NO];
        [_prevButton setEnabled:NO];
    }
    if((_studentArray.count > index) && (index >= 0)){
        if(index == 0){
            [_nextButton setEnabled:YES];
            [_prevButton setEnabled:NO];
        }else if(index == _studentArray.count-1){
            [_nextButton setEnabled:NO];
            [_prevButton setEnabled:YES];
        }else{
            [_nextButton setEnabled:YES];
            [_prevButton setEnabled:YES];
        }
        //get current student and display all appropriate fields
        Student_Info *curr = [_studentArray objectAtIndex:index];
        _nameLabel.text = curr.name;
        _addressLabel.text = curr.address;
        _midtermLabel.text = [NSString stringWithFormat:@"%.1f", curr.midterm_exam];
        _finalLabel.text = [NSString stringWithFormat:@"%.1f", curr.final_exam];
        _hw1Label.text = [NSString stringWithFormat:@"%d", curr.hw1];
        _hw2Label.text = [NSString stringWithFormat:@"%d", curr.hw2];
        _hw3Label.text = [NSString stringWithFormat:@"%d", curr.hw3];
    }
}

//segue
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}

@end
