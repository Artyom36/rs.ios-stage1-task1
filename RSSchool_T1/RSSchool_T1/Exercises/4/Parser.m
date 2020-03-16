#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSMutableArray *characters = [NSMutableArray new];
    NSMutableArray<NSNumber*> *indexes = [NSMutableArray new];
    
    NSArray *brackets = @[@"<", @">", @"[", @"]", @"(", @")"];
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if ([brackets containsObject:substring]) {
            [indexes addObject:@(substringRange.location)];
            [characters addObject:substring];
        }
    }];
    
    NSMutableArray *substrings = [NSMutableArray new];
    
    for (NSInteger i = 0; i < characters.count - 1; i++) {
        NSInteger level = 0;
        if (![self isOpeningBracket:characters[i]]) {
            continue;
        }
        for (NSInteger j = i+1; j < characters.count; j++) {
            
            if ([characters[i] isEqualToString:characters[j]]) {
                level ++;
                continue;
            }
            
            if ([self isClosingBracket:characters[j] forOpening:characters[i]]) {
                if (level == 0) {
                    NSInteger firstIndex = indexes[i].integerValue + 1;
                    NSString *sub = [string substringWithRange:NSMakeRange(firstIndex, indexes[j].integerValue - firstIndex)];
                    [substrings addObject:sub];
                    break;
                } else {
                    level--;
                }
            }
        }
    }
    return substrings;
}


-(BOOL)isOpeningBracket:(NSString *)bracket {
    NSArray *brackets = @[@"<", @"[", @"("];
    return [brackets containsObject:bracket];
}

-(BOOL)isClosingBracket:(NSString *)closing forOpening:(NSString*)opening {
    return [closing isEqualToString: [self pairFor:opening]];
}

-(NSString *)pairFor:(NSString *)bracket {
    if ([bracket isEqualToString:@"<"]) {
        return @">";
    }
    if ([bracket isEqualToString:@"["]) {
        return @"]";
    }
    if ([bracket isEqualToString:@"("]) {
        return @")";
    }
    return nil;
}

@end
