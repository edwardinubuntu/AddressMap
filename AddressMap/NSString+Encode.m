//
//  NSString+Encode.m
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "NSString+Encode.h"

@implementation NSString (AM)

- (NSString *)encodeString:(NSStringEncoding)encoding {
  return (NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self,
                                                              NULL, (CFStringRef)@";/?:@&=$+{}<>,",
                                                              CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString*)decodedString:(NSStringEncoding)encoding {
  return (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                             (CFStringRef)self,
                                                                             CFSTR(""),
                                                                             encoding);
}

@end
