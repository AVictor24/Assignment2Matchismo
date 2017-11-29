//
//  PlayingCard.m
//  T1-2CardGame
//
//  Created by User on 03/11/2017.
//  Copyright © 2017 User. All rights reserved.
//

#import "PlayingCard.h"
#import "CardMatchingGame.h"
@interface PlayingCard ()

@property (nonatomic,strong) CardMatchingGame *game;

@end

@implementation PlayingCard

- (NSString *) contents{ // override the getter method of Card
    
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    // the rank is applyed to rankStrings, so if the Rank is 1, you have A
}


- (int)match:(NSArray *)othercards{
    int score = 0;
    
    if([othercards count] == 3){
        PlayingCard *secondCard = [othercards objectAtIndex:1];
        PlayingCard *thirdCard = [othercards objectAtIndex:2];
        
        if(self.rank == secondCard.rank && self.rank == thirdCard.rank){
            score = 8;
            
        }
        
        else if(thirdCard.rank == secondCard.rank){
            score = 4;
            if([thirdCard.suit isEqualToString:self.suit] || [secondCard.suit isEqualToString:self.suit]){
                score +=  1;
                
            }
        }
        else if(self.rank == secondCard.rank || self.rank == thirdCard.rank){
            score = 4;
            if([self.suit isEqualToString:secondCard.suit] || [self.suit isEqualToString:thirdCard.suit]){
                score += 1;
                
            }
        }
        
        if([self.suit isEqualToString:secondCard.suit] && [self.suit isEqualToString:thirdCard.suit]){
            score = 2;
            
        }
        
        else if([thirdCard.suit isEqualToString:secondCard.suit]){
            score = 1;
            if(thirdCard.rank == self.rank || secondCard.rank == self.rank){
                score += 4;
            }
        }
        else if([self.suit isEqualToString:secondCard.suit] || [self.suit isEqualToString:thirdCard.suit]){
            score = 1;
            if(self.rank == secondCard.rank || self.rank == thirdCard.rank){
                score += 4;
                
            }
        }
        
    }
    else if([othercards count] == 4){ ///incomplete
        PlayingCard *self = [othercards objectAtIndex:0];
        PlayingCard *secondCard = [othercards objectAtIndex:1];
        PlayingCard *thirdCard = [othercards objectAtIndex:2];
        PlayingCard *forthCard = [othercards objectAtIndex:3];
        
        if(self.rank == secondCard.rank && self.rank == thirdCard.rank && self.rank == forthCard.rank){
            score = 12;
            
        }
        else if(thirdCard.rank == secondCard.rank && forthCard.rank == thirdCard.rank){
            score = 8;
            if([self.suit isEqualToString:forthCard.suit] || [self.suit isEqualToString:thirdCard.suit] || [self.suit isEqualToString:secondCard.suit]){
                score += 1;
                
            }
        }
        if([self.suit isEqualToString:secondCard.suit] && [self.suit isEqualToString:thirdCard.suit] && [self.suit isEqualToString:forthCard.suit]){
            score = 4;
            
        }
        
        else if([thirdCard.suit isEqualToString:secondCard.suit] && [forthCard.suit isEqualToString:thirdCard.suit]){
            score = 2;
            if(self.rank == forthCard.rank || self.rank == thirdCard.rank || self.rank == secondCard.rank){
                score += 4;
            }
        }
        
    }
    else {
        PlayingCard *self = [othercards objectAtIndex:0];
        PlayingCard *secondCard = [othercards objectAtIndex:1];
        if(self.rank == secondCard.rank){
            score = 4;
        }
        else if([self.suit isEqualToString:secondCard.suit]){
            score = 1;
        }
    }
    
    return score;
}
@synthesize suit = _suit;

+ (NSArray *)validSuits{
    return @[@"♠︎",@"♣︎",@"❤️",@"♦️"];
}

- (void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *) suit{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank{
    
    return [[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
