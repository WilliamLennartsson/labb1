//
//  AboutViewController.m
//  AppenOmMig
//
//  Created by will on 2018-01-16.
//  Copyright © 2018 will. All rights reserved.
//

#import "AboutViewController.h"
#import "SettingsViewController.h"

@interface AboutViewController ()
@property (weak, nonatomic) IBOutlet UIButton *category1Button;
@property (weak, nonatomic) IBOutlet UIButton *category2Button;
@property (weak, nonatomic) IBOutlet UIButton *category3Button;
@property (weak, nonatomic) IBOutlet UIButton *category4Button;
@property (weak, nonatomic) IBOutlet UITextView *TextView;
@property (weak, nonatomic) IBOutlet UILabel *SubjectTitelLabel;
@property (weak, nonatomic) IBOutlet UIImageView *UnderContructionImage;
@property (strong, nonatomic) IBOutlet UIView *AboutView;
@property (weak, nonatomic) IBOutlet UIScrollView *textScrollView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.UnderContructionImage.hidden=YES;
    [self importStrings];
    
    _SubjectTitelLabel.text = aboutTitel;
    _descriptionLabel.text = aboutText;
    
    SettingsViewController *controller = [[SettingsViewController alloc]init];
    self.AboutView.backgroundColor = [controller getStoredColor];
}


- (IBAction)onClickBtnAbout:(id)sender {
    self.UnderContructionImage.hidden=YES;

    _SubjectTitelLabel.text = aboutTitel;
    _descriptionLabel.text = aboutText;
}

- (IBAction)onClickBtnTravels:(id)sender {
    self.UnderContructionImage.hidden=YES;
    _SubjectTitelLabel.text = travelsTitel;
    _descriptionLabel.text = travelsText;
}

- (IBAction)onClickBtnHobbies:(id)sender {
    self.UnderContructionImage.hidden=YES;
    _SubjectTitelLabel.text = hobbiesTitel;
    _descriptionLabel.text = hobbiesText;
}

- (IBAction)onClickBtnContact:(id)sender {
    self.UnderContructionImage.hidden=NO;
    _SubjectTitelLabel.text = contactTitel;
    _descriptionLabel.text = contactText;
}

-(void) btnPressed:(int)selectedButton{
    
}

NSString *aboutTitel = @"What About Some...";
NSString *aboutText = @"This is about Me (Will).\r But what about some amazon rain, a medium sized camp fire nurtured by the slightest breeze and a collective idea. Where problems of the present seems to fade into vast distances. Expand each and every aspect of normalized concepts won’t make your idea, YOUR concept less important, though the aftermath might occur vastly different.\r I also like programming and";
NSString *travelsTitel = @"Travels and endevavours";
NSString *travelsText = @"Climbing mountains, exploring hidden treasures or just having a slightly too large plate of fruit.\rTraveling is probably the thing I’ve spent the most time on in my entire life and have always loved the feeling of ”being on an adventure” because its just that!";

NSString *hobbiesTitel = @"Hobbies is under construction";
NSString *hobbiesText = @"From a hairdresser with enormous creativity paired with a smart teacher with horrible singing voice came I.. a travelenthusiast, hobby musician and late-night painter.";

NSString *contactTitel = @"";
NSString *contactText = @"";

-(void) importStrings{
    
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
