//
//  SettingsViewController.m
//  AppenOmMig
//
//  Created by will on 2018-01-15.
//  Copyright © 2018 will. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *RedAmountSlider;
@property (weak, nonatomic) IBOutlet UISlider *GreenAmountSlider;
@property (weak, nonatomic) IBOutlet UISlider *BlueAmountSlider;
@property (weak, nonatomic) IBOutlet UIButton *SaveSettingsButton;
@property (strong, nonatomic) IBOutlet UIView *WillsFutureView;
@property (strong, nonatomic) IBOutlet UIView *WillsAboutView;
@property (strong, nonatomic) IBOutlet UIView *SettingsView;
@property (weak, nonatomic) IBOutlet UIButton *RandomizeButton;
@property (weak, nonatomic) IBOutlet UIButton *InvertButton;
@property (weak, nonatomic) IBOutlet UILabel *RGBLabel;


@end

@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateColor];
    
    // Do any additional setup after loading the view.
}
-(UIColor*) defaultColor{
    return [UIColor colorWithRed:0.0f
                           green:0.0f
                            blue:0.0f
                           alpha:1.0f];
}

-(UIColor*) preLoadedColor {
    return [UIColor colorWithRed:0.26f green:0.66f blue:0.65f alpha:1.0f];
}

-(UIColor*) getStoredColor {
    if ([[self savedColor]isEqual:[self defaultColor]]){
        return [self preLoadedColor];
    } else {
        return [self savedColor];
    }
}

-(void)updateColor{
    [[self SettingsView]setNeedsDisplay];
    if ([[self savedColor]isEqual:[self defaultColor]]){
        self.SettingsView.backgroundColor = [self preLoadedColor];
    } else {
        self.SettingsView.backgroundColor = [self savedColor];
    }
}

-(UIColor*) savedColor {
    float redTemp = [[NSUserDefaults standardUserDefaults] floatForKey:@"RedAmount"];
    float greenTemp = [[NSUserDefaults standardUserDefaults] floatForKey:@"GreenAmount"];
    float blueTemp = [[NSUserDefaults standardUserDefaults] floatForKey:@"BlueAmount"];
    
    self.RedAmountSlider.value = redTemp;
    self.GreenAmountSlider.value = greenTemp;
    self.BlueAmountSlider.value = blueTemp;
    
    return [UIColor colorWithRed:redTemp
                           green:greenTemp
                            blue:blueTemp
                           alpha:1.0f];
    
}
- (IBAction)RandomizeButtonPressed:(id)sender {
    self.RedAmountSlider.value = [self RNG];
    self.GreenAmountSlider.value = [self RNG];
    self.BlueAmountSlider.value = [self RNG];
    [self refreshColor];
}
- (IBAction)InvertButtonPressed:(id)sender {
    self.RedAmountSlider.value = 1 - self.RedAmountSlider.value;
    self.GreenAmountSlider.value = 1 - self.GreenAmountSlider.value;
    self.BlueAmountSlider.value = 1 - self.BlueAmountSlider.value;
    [self refreshColor];
}

-(float) RNG {
    float rand = (arc4random_uniform(100.0))/100.0;
    return rand;
}

- (IBAction)ChangedSlider:(id)sender {
    [self refreshColor];
}

- (IBAction)SaveSettings:(id)sender {
    
    self.RGBLabel.text = [NSString stringWithFormat:@"%f , %f , %f", _RedAmountSlider.value, _GreenAmountSlider.value, _BlueAmountSlider.value];
    
    NSUserDefaults *userSettings = [NSUserDefaults standardUserDefaults];
    userSettings = [NSUserDefaults standardUserDefaults];
    [userSettings setFloat: _RedAmountSlider.value forKey:@"RedAmount"];
    [userSettings setFloat: _GreenAmountSlider.value forKey:@"GreenAmount"];
    [userSettings setFloat: _BlueAmountSlider.value forKey:@"BlueAmount"];
    [userSettings synchronize];
}


-(void) refreshColor {
    self.SettingsView.backgroundColor = [self currentColor];
    
}

-(UIColor*) currentColor {
    return [UIColor colorWithRed:self.RedAmountSlider.value
                           green:self.GreenAmountSlider.value blue:self.BlueAmountSlider.value alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
