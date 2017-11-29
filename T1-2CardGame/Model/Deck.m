//
//  Deck.m
//  T1-2CardGame
//
//  Created by User on 03/11/2017.
//  Copyright © 2017 User. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation Deck


- (NSMutableArray *)cards{
    if(! _cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop == true){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card{
    [self.cards addObject:card];
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    else {
        randomCard = nil;
    }
    
    return randomCard;
}

@end
