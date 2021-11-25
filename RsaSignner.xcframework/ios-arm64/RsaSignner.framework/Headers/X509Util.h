//
//  X509Util.h
//  Voffice2.1
//
//  Created by VTIT on 10/20/14.
//
//

#import <Foundation/Foundation.h>

@interface X509Util : NSObject

+ (NSString *) HexToString:(NSData *)data;
+ (NSData *) StringToHex:(NSString *)data;
+ (NSString *)randomBitAESKeyWithLength:(NSInteger)length;
@end
