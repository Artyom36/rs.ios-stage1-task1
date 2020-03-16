#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if (sadArray.count < 3) {
        return sadArray;
    }
        
    NSMutableArray<NSNumber*> *happy = [NSMutableArray arrayWithObject:sadArray.firstObject];
    NSArray<NSNumber*> *sad = sadArray;
    
    for (int i = 1; i < sad.count - 1; i++) {
        NSInteger previous = happy.lastObject.integerValue;
        NSInteger current = sad[i].integerValue;
        NSInteger next = sad[i + 1].integerValue;
        if (current < previous + next ) {
            [happy addObject:sad[i]];
        }
        if (i == sad.count - 2) {
            [happy addObject:sad[i + 1]];
            break;
        }
    }

    if ([self isHappy:happy]) {
        return happy;
    } else {
        return [self convertToHappy: happy];
    }
}

- (BOOL)isHappy:(NSArray<NSNumber*> *)array {
    
    for (int i = 1; i < array.count - 1; i++) {
        NSInteger previous = array[i-1].integerValue;
        NSInteger current = array[i].integerValue;
        NSInteger next = array[i+1].integerValue;
        
        if (next + previous < current) {
            return false;
        }
    }
    return true;
}


@end
