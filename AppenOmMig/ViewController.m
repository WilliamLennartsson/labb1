//
//  ViewController.m
//  AppenOmMig
//
//  Created by will on 2018-01-14.
//  Copyright © 2018 will. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *MainViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateColor];
}

-(void)loadViewIfNeeded{
    [super loadViewIfNeeded];
    [self updateColor];
}
-(void)updateColor{
    SettingsViewController *controller = [[SettingsViewController alloc]init];
    self.MainViewController.backgroundColor = [controller getStoredColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
