//
//  GameViewController.m
//  AppenOmMig
//
//  Created by will on 2018-01-14.
//  Copyright © 2018 will. All rights reserved.
//

#import "GameViewController.h"
#import "SettingsViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *GuessAnswerLabel;
@property (weak, nonatomic) IBOutlet UIButton *RandomButton;
@property (weak, nonatomic) IBOutlet UISlider *GuessSlider;
@property (weak, nonatomic) IBOutlet UILabel *NumberSlider;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *WonGameLabel;
@property (strong, nonatomic) IBOutlet UIView *GameViewController;
@property (weak, nonatomic) IBOutlet UILabel *AmountOfGuessesLabel;
@property (weak, nonatomic) IBOutlet UILabel *HighScoreLabel;



@end

@implementation GameViewController
int randomNumber;
int score = 0;
int numOfGuesses = 0;
int highScore = 24;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    //[self updateColor];
}
-(void)loadViewIfNeeded{
    [super loadViewIfNeeded];
    SettingsViewController *controller = [[SettingsViewController alloc]init];
    self.GameViewController.backgroundColor = [controller getStoredColor];
}

-(void) initialize {
    [_WonGameLabel setHidden: YES];
    [_AmountOfGuessesLabel setText:[NSString stringWithFormat:@"Guesses: %d", numOfGuesses]];
    [_HighScoreLabel setText:[NSString stringWithFormat:@"Best Round: %d guesses", highScore]];
    [self newGame];
}
-(void) newGame{
    randomNumber = [self RNG];
    numOfGuesses = 0;
    sliderValue = 50;
    [_WonGameLabel setHidden:YES];
    [_GuessAnswerLabel setText:[NSString stringWithFormat:@"Guess a number between 1 - 100"]];
    [_ScoreLabel setText: [NSString stringWithFormat: @"Score: %d", score]];

}
-(int) RNG {
    return arc4random_uniform(100) + 1;
    //add slider for number range
}
int sliderValue;
- (IBAction)ChangedSlider:(id)sender {
    sliderValue = [self getCurrentValue];
    [_NumberSlider setText:[NSString stringWithFormat:@"%d", sliderValue]];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.GameViewController endEditing:YES];
}


-(int) getCurrentValue {
    return _GuessSlider.value;
}

- (IBAction)PressedRandomButton:(id)sender {
    if ([_WonGameLabel isHidden] == NO){
        [self newGame];
    }
    
    numOfGuesses++;
    [_AmountOfGuessesLabel setText:[NSString stringWithFormat:@"Guesses: %d", numOfGuesses]];
    
    if ([self guess] < randomNumber){
        _GuessAnswerLabel.text = [NSString stringWithFormat:@"Higher"];
    } else if ([self guess] > randomNumber) {
        _GuessAnswerLabel.text = [NSString stringWithFormat:@"Lower"];
    } else {
        _GuessAnswerLabel.text = [NSString stringWithFormat:@"Just right!"];
        [self addScore];
        [_WonGameLabel setHidden:NO];
        //Add Score
    }
}

- (int) guess {
    return (int) self.GuessSlider.value;
}
-(void) addScore{
    score ++;
    [_ScoreLabel setText: [NSString stringWithFormat: @"Score: %d", score]];
    if (numOfGuesses < highScore){
        highScore = numOfGuesses;
        [_HighScoreLabel setText: [NSString stringWithFormat: @"Best Round: %d ", highScore]];
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

- (IBAction)TextFieldClickable:(id)sender {
}
@end
