#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
//    NSMutableArray *array = [NSMutableArray new];
    NSInteger res = 0;
    for (int i=0; i<8; i++) {
        res <<= 1;
        res |= n&1;
        n >>= 1;
    }
    
    return res;
}
