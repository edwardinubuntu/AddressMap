//
//  NSString+Encode.h
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encode)

- (NSString *)encodeString:(NSStringEncoding)encoding;
- (NSString*)decodedString:(NSStringEncoding)encoding;

@end
