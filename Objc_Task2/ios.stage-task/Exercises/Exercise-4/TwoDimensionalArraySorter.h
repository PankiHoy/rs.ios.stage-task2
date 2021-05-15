#import <Foundation/Foundation.h>

@interface TwoDimensionalArraySorter : NSObject

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array;
- (NSArray *) mergeArray:(NSArray *)leftArray rightArray:(NSArray *)rightArray;
- (NSArray *) mergeSortArray:(NSArray *)unsortedArray;

@end

