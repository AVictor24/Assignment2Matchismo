//
//  Card.m
//  T1-2CardGame
//
//  Created by User on 03/11/2017.
//  Copyright © 2017 User. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)othercards{//othercards is an argument
    
    int score = 0;
    
    for(Card *card in othercards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return score;
    
}

@end
