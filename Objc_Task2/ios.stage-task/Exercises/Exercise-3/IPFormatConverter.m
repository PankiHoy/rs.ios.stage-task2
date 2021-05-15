#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableString *resultString = [NSMutableString stringWithString:@""];
    if (numbersArray.count > 0) {
        for (int i=0; i<4; i++) {
            if (i < numbersArray.count) {
                if ([numbersArray[i] integerValue] < 0) {
                    return @"Negative numbers are not valid for input.";
                }
                if ([numbersArray[i] integerValue] > 255) {
                    return @"The numbers in the input array can be in the range from 0 to 255.";
                }
                [resultString appendFormat:@"%@.", numbersArray[i]];
            } else {
                [resultString appendString:@"0."];
            }
        }
        [resultString deleteCharactersInRange:NSMakeRange(resultString.length-1, 1)];
        
        return resultString;
    }
    return @"";
}

@end
