//
//  ViewController.m
//  T1-2CardGame
//
//  Created by User on 02/11/2017.
//  Copyright © 2017 User. All rights reserved.
//


#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()


@property (nonatomic,strong) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;


@end


@implementation ViewController

/*
 @synthesize numberOfMatches;
 - (BOOL)textFieldShouldReturn:(UITextField *)textField{
 return YES;
 }
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.numberOfMatches.delegate = self;
    
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)touchSegmentButton:(UISegmentedControl *)sender {
    
    switch (self.segmentControl.selectedSegmentIndex) {
        case 0:
            [self.game setNumberOfMatches:2];
            break;
        case 1:
            [self.game setNumberOfMatches:3];
            break;
        case 2:
            [self.game setNumberOfMatches:4];
            break;
            
        default:
            break;
    }
}
- (IBAction)touchRedealButton:(UIButton *)sender {
    
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    [self updateUI];
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.enabled = true;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    self.segmentControl.enabled = false;
    [self updateUI];
}

- (void)updateUI{
    
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        self.infoLabel.text = [self.game getDisplay];
    }
    
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";  // return content otherwise reuturn ""
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardFront" : @"lights"];
}

@end









