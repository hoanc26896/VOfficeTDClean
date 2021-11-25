//
//  Util.h
//  RsaSignner
//
//  Created by Hoa Nguyen on 11/24/21.
//

#ifndef Util_h
#define Util_h


#endif /* Util_h */
#import <Foundation/Foundation.h>

@interface Util: NSObject
+(NSString *) encryptAES256DictionaryToBase64String:(NSDictionary*) dic withKey:(NSString *) key andIV:(NSString*)iv;
+(NSDictionary*) decryptAES256Base64StringToDictionary:(NSString*) str withKey:(NSString *) key andIV:(NSString*)iv;

+(NSString *) encryptAES256DictionaryToHexString:(NSDictionary*) dic withKey:(NSString *) key andIV:(NSString*)iv;
+(NSDictionary*) decryptAES256HexStringToDictionary:(NSString*) str withKey:(NSString *) key andIV:(NSString*)iv;

+(NSString *) encryptAES256StringToHexString:(NSString*) str withKey:(NSString *) key andIV:(NSString*)iv;
+(NSString*) decryptAES256HexStringToString:(NSString*) str withKey:(NSString *) key andIV:(NSString*)iv;

+(NSData*)encryptAES256ToData:(NSData*) data withKey:(NSString *) key andIV:(NSString*)iv;
+(NSData*) decryptAES256ToData:(NSData*) data withKey:(NSString *) key andIV:(NSString*)iv;

@end
