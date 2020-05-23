//
//  GameViewController.m
//  Sudoku
//
//  Created by NYU on 3/6/20.
//  Copyright © NYU All rights reserved.
//
//Ivanna Pena
//ip807

#import "GameViewController.h"
#import "MyUIButton.h"
#import "Game.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet MyUIButton *number1Button;
@property (weak, nonatomic) IBOutlet MyUIButton *number2Button;
@property (weak, nonatomic) IBOutlet MyUIButton *number3Button;
@property (weak, nonatomic) IBOutlet MyUIButton *number4Button;

@property (weak, nonatomic) IBOutlet MyUIButton *grid00Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid01Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid02Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid03Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid10Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid11Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid12Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid13Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid20Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid21Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid22Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid23Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid30Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid31Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid32Button;
@property (weak, nonatomic) IBOutlet MyUIButton *grid33Button;

@property (strong, nonatomic) NSArray *gridButtons;
@property (strong, nonatomic) NSArray *numberButtons;

@property (strong, nonatomic) Game *game;

@property (strong, nonatomic) MyUIButton *activeButton;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.gridButtons = [[NSArray alloc] initWithObjects:
                        [[NSArray alloc] initWithObjects: self.grid00Button, self.grid01Button, self.grid02Button, self.grid03Button, nil],
                        [[NSArray alloc] initWithObjects: self.grid10Button, self.grid11Button, self.grid12Button, self.grid13Button, nil],
                        [[NSArray alloc] initWithObjects: self.grid20Button, self.grid21Button, self.grid22Button, self.grid23Button, nil],
                        [[NSArray alloc] initWithObjects: self.grid30Button, self.grid31Button, self.grid32Button, self.grid33Button, nil],
                        nil];
    
    self.numberButtons = [[NSArray alloc] initWithObjects:self.number1Button, self.number2Button, self.number3Button, self.number4Button, nil];
    
    for (int x = 0; x < 4; x ++) {
        for (int y = 0; y < 4; y ++) {
            MyUIButton * currentButton = self.gridButtons[x][y];
            
            currentButton.x = x;
            currentButton.y = y;
        }
    }
    
    // TODO: Finish this method-----DONE
    //starts a new game
    [self restart];
}

- (IBAction)gridButtonPressed:(MyUIButton *)sender {
    // TODO: Finish this method-----DONE
    //If “activeButton” points to the current, deactivate the current button (change the background color to white) and remove it from “activeButton”.
    if(_activeButton == sender){
        _activeButton.backgroundColor = [UIColor whiteColor];
        sender.enabled = NO;
        _activeButton = nil;
        //NSLog(@"ACTIVE BUTTON DISACTIVATED%@", _activeButton);
    }
    //If the “activeButton” does not point to anything, we will activate current button (change the background color to yellow) and save it to “activeButton”.
    if(_activeButton == nil){
        //_activeButton.backgroundColor = [UIColor whiteColor];
        sender.backgroundColor = [UIColor yellowColor];
        sender.enabled = YES;
        _activeButton = sender;
    }
    // If the “activeButton” points to another button, we want to deactivate that button and remove it from “activeButton”.
    if(_activeButton != sender){
        _activeButton.backgroundColor = [UIColor whiteColor];
        _activeButton = nil;
        //NSLog(@"DIFFERENT ACTIVE BUTTON DISACTIVATED%@", _activeButton);
    }
    // Adding this if statement again to ensure there is no lag between pressing a different button after it has been deactivated
    if(_activeButton == nil){
        sender.backgroundColor = [UIColor yellowColor];
        sender.enabled = YES;
        _activeButton = sender;
    }
}

- (IBAction)numberButtonPressed:(MyUIButton *)sender {
    // TODO: Finish this method-----DONE
    if(_activeButton != nil){
        //set the number to the active button
        [self.activeButton setTitle:sender.currentTitle forState: UIControlStateNormal];
        [_game setNumber:[sender.titleLabel.text intValue] forGridX:self.activeButton.x andY:self.activeButton.y];
        //deactivate the button
        _activeButton.backgroundColor = [UIColor whiteColor];
        [_activeButton setEnabled:NO];
    }
    //Check if the inputs are valid, if the game ends, and if the player wins or loses the game.
    if(![_game setNumber:[sender.titleLabel.text intValue] forGridX:self.activeButton.x andY:self.activeButton.y]){
        [self loseTheGame];
    }
    if([self.game isEnd]){
        [self winTheGame];
    }
    self.activeButton = nil;
    
}


- (void) loseTheGame {
    // Feel free to read this method, but do not change anything here
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game Over"
                                   message:@"Sorry, you lost."
                                   preferredStyle: UIAlertControllerStyleAlert];
     
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {[self restart];}];
     
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion: nil];
}

- (void) winTheGame {
    // Feel free to read this method, but do not change anything here
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game Over"
                                   message:@"Congratulations, you won!"
                                   preferredStyle: UIAlertControllerStyleAlert];
     
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {[self restart];}];
     
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion: nil];
}

- (void) restart {
    // Feel free to read this method, but do not change anything here
    
    self.game = [[Game alloc] initWithName:@"Your Name" andSize: 4];
    
    for (int x = 0; x < 4; x ++) {
        for (int y = 0; y < 4; y ++) {
            MyUIButton * currentButton = self.gridButtons[x][y];
            
            NSString * currentString = self.game.grid[x][y];
            
            [currentButton setTitle:currentString forState: UIControlStateNormal];
            
            if (![currentString isEqualToString: @""]) {
                currentButton.enabled = NO;
            } else {
                currentButton.enabled = YES;
            }
        }
    }
}

- (IBAction)restartButtonPressed:(id)sender {
    [self restart];
}

@end
