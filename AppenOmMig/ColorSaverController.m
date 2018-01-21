//
//  ColorSaverController.m
//  AppenOmMig
//
//  Created by will on 2018-01-17.
//  Copyright © 2018 will. All rights reserved.
//

#import "ColorSaverController.h"

@interface ColorSaverController ()

@end

@implementation ColorSaverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(UIColor*) defaultColor{
    return [UIColor colorWithRed:0.0f
                           green:0.0f
                            blue:0.0f
                           alpha:1.0f];
}

-(UIColor*) preLoadedColor {
    return [UIColor redColor];
}

-(void) getStoredColor:(ViewController*)viewControllerName{
    [self updateColor:viewControllerName];
}
-(void)updateColor:(ViewController*)viewController{
    [[self.viewController ]setNeedsDisplay];
    if ([[self savedColor]isEqual:[self defaultColor]]){
        self.viewController.backgroundColor = [self preLoadedColor];
    } else {
        self.GameViewController.backgroundColor = [self savedColor];
    }
}

-(UIColor*) savedColor {
    float redTemp = [[NSUserDefaults standardUserDefaults] floatForKey:@"RedAmount"];
    float greenTemp = [[NSUserDefaults standardUserDefaults] floatForKey:@"GreenAmount"];
    float blueTemp = [[NSUserDefaults standardUserDefaults] floatForKey:@"BlueAmount"];
    return [UIColor colorWithRed:redTemp
                           green:greenTemp
                            blue:blueTemp
                           alpha:1.0f];
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
