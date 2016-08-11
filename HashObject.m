//
//  HashObject.m
//  ETMetroHarbour
//
//  Created by WeiHeng on 12-10-29.
//
//

#define CC_MD5_DIGEST_LENGTH 16

#import "HashObject.h"
#import <CommonCrypto/CommonDigest.h>

@implementation HashObject

+ (NSString *)returnMD5Hash:(NSString*)str {
    
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02X", digest[i]];
    
    return output;
}

@end
