#import "BillCounter.h"
#import <Foundation/Foundation.h>

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    double girlsSum = [self sum: [self array:bill withoutIndex:index]].doubleValue / 2;
    
    long diff = (long)(sum.doubleValue - girlsSum);
    
    if (girlsSum == sum.doubleValue) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%ld", diff];
    }
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

@end
