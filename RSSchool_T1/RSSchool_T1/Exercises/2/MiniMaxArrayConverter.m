#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray<NSNumber*>* sums = [NSMutableArray new];
    
    for (int i = 0; i < array.count; i++) {
        NSArray *arr = [self array:array withoutIndex:i];
        [sums addObject: [self sum:arr]];
    }
    
    return @[[self min:sums], [self max:sums]];
}

-(NSArray*)array:(NSArray*)array withoutIndex:(NSInteger)index {
    
    if (index < 0 || index >= array.count) {
        return array;
    }
    
    NSMutableArray<NSNumber*> *arr = [NSMutableArray arrayWithArray:array];
    [arr removeObject:array[index]];
    
    return arr;
}

-(NSNumber*)sum:(NSArray<NSNumber*>*)array {
    return [array valueForKeyPath: @"@sum.self"];
}

-(NSNumber*)min:(NSArray<NSNumber*>*)array {
    return [array valueForKeyPath: @"@min.self"];
}

-(NSNumber*)max:(NSArray<NSNumber*>*)array {
    return [array valueForKeyPath: @"@max.self"];
}

@end
