//
//  PlayingCardDeck.m
//  T1-2CardGame
//
//  Created by User on 03/11/2017.
//  Copyright © 2017 User. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck /// the actual deck full of cards

-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank =1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card]; 
            }
        }
    }
    
    return self;
}

@end
