//
//  Card.h
//  T1-2CardGame
//
//  Created by User on 03/11/2017.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents; // the actual "value" of a card

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)othercards;

@end
