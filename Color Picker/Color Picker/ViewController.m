//
//  ViewController.m
//  Color Picker
//
//  Created by Ivanna Peña on 2/19/20.
//  Copyright © 2020 Ivanna Peña. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UILabel *colorOverlay;
@property (weak, nonatomic) IBOutlet UILabel *redValue;
@property (weak, nonatomic) IBOutlet UILabel *greenValue;
@property (weak, nonatomic) IBOutlet UILabel *blueValue;
@property (weak, nonatomic) IBOutlet UILabel *alphaValue;
@property (weak, nonatomic) IBOutlet UILabel *redHex;
@property (weak, nonatomic) IBOutlet UILabel *greenHex;
@property (weak, nonatomic) IBOutlet UILabel *blueHex;
@property (weak, nonatomic) IBOutlet UILabel *alphaHex;

@end

@implementation ViewController
//initializes the color values
float RedColor = (float) 0;
float GreenColor = (float) 0;
float BlueColor = (float) 0;
float AlphaColor = (float) 0;
//actions for when sliders are moved, call changeColorValues function
- (IBAction)redSliderMoved:(id)sender {
    [self changeColorValues];
}
- (IBAction)greenSliderMoved:(id)sender {
    [self changeColorValues];
}
- (IBAction)blueSliderMoved:(id)sender {
    [self changeColorValues];
}
- (IBAction)alphaSliderMoved:(id)sender {
    [self changeColorValues];
}
//upon load, call randomSliderVal to have sliders for RGB set to different positions
- (void)viewDidLoad {
    [super viewDidLoad];
    [self randomSliderVal];
    // Do any additional setup after loading the view.
}
//sets RGB slider values to different positions
- (void) randomSliderVal{
    self.redSlider.value = (0 + arc4random() % (255));
    self.greenSlider.value = (0 + arc4random() % (255));
    self.blueSlider.value = (0 + arc4random() % (255));
    self.alphaSlider.value = 255;
    [self changeColorValues];
}
//changes the color of the Overlay label to the colors based on the slider values
- (void)changeColorOverlay{
    UIColor *colors = [UIColor colorWithRed:RedColor
    green:GreenColor
     blue:BlueColor
    alpha:AlphaColor];
    self.colorOverlay.backgroundColor = colors;
    [self changeLabels];
}
//converts the slider values into color values
- (void)changeColorValues{
    RedColor = self.redSlider.value / 255;
    GreenColor = self.greenSlider.value / 255;
    BlueColor = self.blueSlider.value / 255;
    AlphaColor = self.alphaSlider.value / 255;
    [self changeColorOverlay];
}
//changes the hex and 0-255 labels according to current slider values
- (void)changeLabels{
    NSString *reds = [[NSString alloc] initWithFormat:@"%0.0f", (RedColor * 255)];
    NSString *greens = [[NSString alloc] initWithFormat:@"%0.0f", (GreenColor * 255)];
    NSString *blues = [[NSString alloc] initWithFormat:@"%0.0f", (BlueColor * 255)];
    NSString *alphas = [[NSString alloc] initWithFormat:@"%0.0f", (AlphaColor * 255)];
    self.redValue.text = reds;
    self.greenValue.text = greens;
    self.blueValue.text = blues;
    self.alphaValue.text = alphas;
    
    NSString *redsHex = [[NSString alloc] initWithFormat:@"%02X", (unsigned int)(RedColor * 255)];
    NSString *greensHex = [[NSString alloc] initWithFormat:@"%02X", (unsigned int)(GreenColor * 255)];
    NSString *bluesHex = [[NSString alloc] initWithFormat:@"%02X", (unsigned int)(BlueColor * 255)];
    NSString *alphasHex = [[NSString alloc] initWithFormat:@"%02X", (unsigned int)(AlphaColor * 255)];
    self.redHex.text = redsHex;
    self.greenHex.text = greensHex;
    self.blueHex.text = bluesHex;
    self.alphaHex.text = alphasHex;
}
@end
