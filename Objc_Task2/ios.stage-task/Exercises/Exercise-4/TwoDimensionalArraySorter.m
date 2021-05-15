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
        return @[[self mergeSortArray:arrayOfDigits], [self mergeSortArray:arrayOfStrings]];
    } else if (arrayOfDigits.count==0) {
        return [self mergeSortArray:arrayOfStrings];
    } else {
        return [self mergeSortArray:arrayOfDigits];
    }
}

- (NSArray *) mergeArray:(NSArray *)leftArray rightArray:(NSArray *)rightArray {
    
    NSMutableArray *returnArray = [NSMutableArray array];
    int i = 0, e = 0;
    
    if ([leftArray[0] isKindOfClass:NSNumber.class]) {
        while (i < [leftArray count] && e < [rightArray count]) {
            int leftValue = [[leftArray objectAtIndex:i] intValue];
            int rightValue = [[rightArray objectAtIndex:e] intValue];
            
            if (leftValue < rightValue) {
                [returnArray addObject: [leftArray objectAtIndex:i++]];
            } else {
                [returnArray addObject: [rightArray objectAtIndex:e++]];
            }
        }
    } else {
        while (i < [leftArray count] && e < [rightArray count]) {
            id leftValue = [leftArray objectAtIndex:i];
            id rightValue = [rightArray objectAtIndex:e];
            
            if ([leftValue compare:rightValue] == NSOrderedAscending) {
                [returnArray addObject: [leftArray objectAtIndex:i++]];
            } else {
                [returnArray addObject: [rightArray objectAtIndex:e++]];
            }
        }
    }
    
    while (i < [leftArray count]) {
        [returnArray addObject: [leftArray objectAtIndex:i++]];
    }
    
    while (e < [rightArray count]) {
        [returnArray addObject: [rightArray objectAtIndex:e++]];
    }
    
    return returnArray;
}


- (NSArray *) mergeSortArray:(NSArray *)unsortedArray {
    int count = (int)[unsortedArray count];
    
    if (count < 2) {
        return unsortedArray;
    }
    
    int middle = count / 2;
    NSArray *leftArray = [unsortedArray subarrayWithRange: NSMakeRange(0, middle)];
    NSArray *rightArray = [unsortedArray subarrayWithRange: NSMakeRange(middle, (count - middle))];
    
    NSArray *returnArray = [self mergeArray: [self mergeSortArray: leftArray]
                                 rightArray: [self mergeSortArray: rightArray]];
    return returnArray;
}

@end
