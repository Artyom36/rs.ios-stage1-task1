#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSString * string = s;
    NSMutableSet<NSString*> *polindromes = [NSMutableSet new];
    
    NSInteger minChanges = [self minChangesNeededToMakePolindromeFrom:[string copy]];
    
    if (minChanges > k.integerValue) {
        return @"-1";
    }
    
    NSInteger changes = 0;
    
    for (int i = 0; i < string.length; i++) {
        
        if (changes >= k.integerValue) {
            break;
        }
        
        NSRange startRange = NSMakeRange(i, 1);
        NSInteger startInt = [[string substringWithRange:startRange] integerValue];
        NSRange endRange = NSMakeRange(string.length - 1 - i, 1);
        NSInteger endInt = [[string substringWithRange:endRange] integerValue];
        
        if (startInt != endInt) {
            NSInteger max = startInt > endInt ? startInt : endInt;
            
            if (max != 9 && minChanges < k.integerValue) {
                max = 9;
                changes ++;
            }
            string = [string stringByReplacingCharactersInRange:endRange withString:[NSString stringWithFormat:@"%ld", max]];
            string = [string stringByReplacingCharactersInRange:startRange withString:[NSString stringWithFormat:@"%ld", max]];
            
            changes ++;
        }
        
        if ([self isPalindrome:string]) {
            [polindromes addObject:[string copy]];
        }
    }
    
    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    NSArray* sortedPolindromes = [polindromes sortedArrayUsingDescriptors:@[sd]];
    NSString *maxPolindrome = sortedPolindromes.firstObject;
    
    return maxPolindrome != nil ? maxPolindrome : @"-1";
}


-(NSInteger)minChangesNeededToMakePolindromeFrom:(NSString*)string {
    
    NSInteger changes = 0;
    while (true) {
        if (string.length < 1) {
            break;
        }
        if ([self isPalindrome:string]) {
            break;
        }
        NSRange startRange = NSMakeRange(0, 1);
        NSInteger startInt = [[string substringWithRange:startRange] integerValue];
        NSRange endRange = NSMakeRange(string.length - 1, 1);
        NSInteger endInt = [[string substringWithRange:endRange] integerValue];
        string = [string substringWithRange:NSMakeRange(1, string.length - 2)];
        if (startInt == endInt) {
            continue;
        } else {
           changes ++;
        }
    }
    return changes;
}


- (BOOL)isPalindrome:(NSString *)string {
    if ([string length] < 1) {
        return NO;
    } else {
        NSUInteger start = 0;
        NSUInteger end = [string length] - 1;
        while (start < end) {
            NSString *startSub = [string substringWithRange:NSMakeRange(start, 1)];
            NSString *endSub = [string substringWithRange:NSMakeRange(end, 1)];
            if ([startSub isEqualToString:endSub]) {
                start++;
                end--;
                continue;
            } else {
                return NO;
            }
        }
        return YES;
    }
}

@end
