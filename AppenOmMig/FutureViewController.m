//
//  FutureViewController.m
//  AppenOmMig
//
//  Created by will on 2018-01-16.
//  Copyright © 2018 will. All rights reserved.
//

#import "FutureViewController.h"
#import "SettingsViewController.h"
#import "FutureWillModel.h"
@interface FutureViewController ()
@property (strong, nonatomic) IBOutlet UIView *FutureView;
@property (weak, nonatomic) IBOutlet UILabel *futureDescription;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation FutureViewController
int imageCounter = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = @[@"vulkan", @"vulkan2",@"vattenfall", @"cykel", @"kalltsomfan", @"lila"];
    SettingsViewController *settings = [[SettingsViewController alloc] init];
    _FutureView.backgroundColor = [settings getStoredColor];
    _futureDescription.text = [self getDescriptionText];
    
    
    
    
    
    
    
}

- (IBAction)onClickChangeImage:(id)sender {
    _imageView.image = [UIImage imageNamed:_imageArray[imageCounter]];
    imageCounter++;
    if (imageCounter >= _imageArray.count){
        imageCounter = 0;
    }

    
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
-(NSString*) getDescriptionText {
    NSString *text = [NSString stringWithFormat:@"Why I started studying programming has more reasons than one. For starters problem solving is something I’ve always enjoyed and to do it as a job is a dream come true. AND I can be anywhere while doing it. So the plan for Future me. In a few years I should be creating apps in tropical weather sipping drinks with tiny umbrellas. Though you never know, but it sure would be nice."];
    return text;
}

@end
