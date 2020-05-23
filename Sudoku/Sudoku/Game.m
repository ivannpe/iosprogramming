//
//  Game.m
//  Sudoku
//
//  Created by NYU on 3/7/20.
//  Copyright © 2020 NYU All rights reserved.
//
// Ivanna Pena
// ip807
#import "Game.h"

@implementation Game

- (instancetype) initWithName: (NSString *) name andSize: (int) size {
    // TODO: Finish this method-----DONE
    self = [super init];
    if (!self) return nil;
    [self setName:name];
    [self setSize:(int)size];
    [self sudokuGenerator];
    return self;
    
    
    
    
}

- (instancetype) init {
    // TODO: Finish this method-----DONE
    self = [super init];
    if (!self) return nil;
    [self setName:@"Anonymous"];
    [self setSize:(int)4];
    [self sudokuGenerator];
    return self;
}

- (BOOL) setNumber: (int) number forGridX: (int) x andY: (int) y {
    // TODO: Finish this method-----DONE
    
//    When the user chooses a number for cell (X, Y), we use this method to save the number to the grid.
//    Return True if the input is valid, or False otherwise.
//    A private method called “isValid” is provided (see below) for you to valid the user inputs.
    self.grid[x][y] = [@(number) stringValue];
    return [self isValid];

}

- (BOOL) isEnd {
    // TODO: Finish this method-----DONE
    //    Return True if all inputs are valid, and there is no empty cell.
    //    Return False otherwise.
    for (int x = 0; x < _size; x ++) {
        for (int y = 0; y < _size; y ++) {
            if([_grid[x][y] isEqualToString: @""]) {
                return false;
            }
        }
    }
    return [self isValid];
}



- (NSMutableArray *) sudokuGenerator {
    // Feel free to read this method to understand how to use _grid[x][y], but do not change anything here
    
    // this should be a new NSMutableArray, but since we need use [self isValid], we have to put the result in _grid
    _grid = [NSMutableArray arrayWithObjects:
            [NSMutableArray arrayWithObjects: @"", @"", @"", @"", nil],
            [NSMutableArray arrayWithObjects: @"", @"", @"", @"", nil],
            [NSMutableArray arrayWithObjects: @"", @"", @"", @"", nil],
            [NSMutableArray arrayWithObjects: @"", @"", @"", @"", nil], nil];
    
    int retryCount = 0;
    
    // TODO: find a better algorithm to generate problem
    for (int x = 0; x < _size; x ++) {
        for (int y = 0; y < _size; y ++) {
            _grid[x][y] = [NSString stringWithFormat: @"%d", arc4random_uniform(_size) + 1];
            
            while (![self isValid]) {
                _grid[x][y] = [NSString stringWithFormat: @"%d", arc4random_uniform(_size) + 1];
                
                retryCount += 1;
                
                // in a rare case, there is no solution, we have to restart the generator
                if (retryCount > 100)
                    return [self sudokuGenerator];
            }
        }
    }
    
    for (int x = 0; x < _size; x ++) {
        for (int y = 0; y < _size; y ++) {
            if ( arc4random_uniform(3) != 0 )
                _grid[x][y] = @"";
        }
    }
    
    return _grid;
}

- (BOOL) isValid {
    // Feel free to read this method
    // Bonus Points: come out a better algorithm to check if the Sudoku is valid
    
    // for each coloum
    for (int x = 0; x < _size; x ++) {
        for (int y = 0; y < _size - 1; y ++) {
            if ([_grid[x][y] isEqualToString: @""]) {
                continue;
            }
            
            for (int z = y + 1; z < _size; z ++) {
                if ([_grid[x][y] isEqualToString: _grid[x][z]]) {
                    return false;
                }
            }
        }
    }
    
    // for each row
    for (int y = 0; y < _size; y ++) {
        for (int x = 0; x < _size - 1; x ++) {
            if ([_grid[x][y] isEqualToString: @""]) {
                continue;
            }
            
            for (int z = x + 1; z < _size; z ++) {
                if ([_grid[x][y] isEqualToString: _grid[z][y]]) {
                    return false;
                }
            }
        }
    }
    
    
    
    // for each small grid
    int x = 0, y = 0;
    
    if ((![_grid[x][y] isEqualToString: @""] && ([_grid[x][y] isEqualToString: _grid[x + 1][y]] || [_grid[x][y] isEqualToString: _grid[x][y + 1]] || [_grid[x][y] isEqualToString: _grid[x + 1][y + 1]]))
        || (![_grid[x + 1][y] isEqualToString: @""] && ([_grid[x + 1][y] isEqualToString: _grid[x][y + 1]] || [_grid[x + 1][y] isEqualToString: _grid[x + 1][y + 1]])) ||
        (![_grid[x][y + 1] isEqualToString: @""] && [_grid[x][y + 1] isEqualToString: _grid[x + 1][y + 1]])) {
            return false;
    }
    
    x = 2; y = 0;
    
    if ((![_grid[x][y] isEqualToString: @""] && ([_grid[x][y] isEqualToString: _grid[x + 1][y]] || [_grid[x][y] isEqualToString: _grid[x][y + 1]] || [_grid[x][y] isEqualToString: _grid[x + 1][y + 1]]))
        || (![_grid[x + 1][y] isEqualToString: @""] && ([_grid[x + 1][y] isEqualToString: _grid[x][y + 1]] || [_grid[x + 1][y] isEqualToString: _grid[x + 1][y + 1]])) ||
        (![_grid[x][y + 1] isEqualToString: @""] && [_grid[x][y + 1] isEqualToString: _grid[x + 1][y + 1]])) {
            return false;
    }
    
    x = 0; y = 2;
    
    if ((![_grid[x][y] isEqualToString: @""] && ([_grid[x][y] isEqualToString: _grid[x + 1][y]] || [_grid[x][y] isEqualToString: _grid[x][y + 1]] || [_grid[x][y] isEqualToString: _grid[x + 1][y + 1]]))
        || (![_grid[x + 1][y] isEqualToString: @""] && ([_grid[x + 1][y] isEqualToString: _grid[x][y + 1]] || [_grid[x + 1][y] isEqualToString: _grid[x + 1][y + 1]])) ||
        (![_grid[x][y + 1] isEqualToString: @""] && [_grid[x][y + 1] isEqualToString: _grid[x + 1][y + 1]])) {
            return false;
    }
    
    x = 2; y = 2;
    
    if ((![_grid[x][y] isEqualToString: @""] && ([_grid[x][y] isEqualToString: _grid[x + 1][y]] || [_grid[x][y] isEqualToString: _grid[x][y + 1]] || [_grid[x][y] isEqualToString: _grid[x + 1][y + 1]]))
        || (![_grid[x + 1][y] isEqualToString: @""] && ([_grid[x + 1][y] isEqualToString: _grid[x][y + 1]] || [_grid[x + 1][y] isEqualToString: _grid[x + 1][y + 1]])) ||
        (![_grid[x][y + 1] isEqualToString: @""] && [_grid[x][y + 1] isEqualToString: _grid[x + 1][y + 1]])) {
            return false;
    }
            
    return true;
}


@end
