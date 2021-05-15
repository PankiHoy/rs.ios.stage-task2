#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *arrayOfStrings = [NSMutableArray new];
    NSMutableArray *arrayOfDigits = [NSMutableArray new];
    
    for (int i=0; i<array.count; i++) {
        if ([array[i] isKindOfClass:NSArray.class]) {
            if ([array[i].firstObject isKindOfClass:NSString.class]) {
                [arrayOfStrings addObjectsFromArray:array[i]];
            } else if ([array[i].firstObject isKindOfClass:NSNumber.class]) {
                [arrayOfDigits addObjectsFromArray:array[i]];
            }
        } else {
            return @[];
        }
    }
    
    if (arrayOfDigits.count>0 && arrayOfStrings.count>0) {
        [arrayOfDigits sortUsingDescriptors:
         [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES], nil]];
        [arrayOfStrings sortUsingDescriptors:
         [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO], nil]];
        
        return @[arrayOfDigits, arrayOfStrings];
    } else if (arrayOfDigits.count == 0) {
        [arrayOfStrings sortUsingDescriptors:
         [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES], nil]];
        
        return arrayOfStrings;
    } else {
        [arrayOfDigits sortUsingDescriptors:
         [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES], nil]];
        
        return arrayOfDigits;
    }
}

@end
