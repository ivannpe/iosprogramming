//
//  Game.h
//  Sudoku
//
//  Created by Alan Luo on 3/7/20.
//  Copyright © NYU All rights reserved.
//
// Ivanna Pena
// ip807
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

// TODO: List all the properties-----DONE
@property NSString *name;
@property int size;
@property NSMutableArray *grid;




// TODO: List all the public methods-----DONE
- (instancetype) init;
- (instancetype) initWithName: (NSString *) name andSize: (int) size;
- (BOOL) setNumber: (int) number forGridX: (int) x andY: (int) y;
- (BOOL) isEnd;







@end

NS_ASSUME_NONNULL_END
