//
//  AMLocationSpot.m
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "AMLocationSpot.h"

@implementation AMLocationSpot

@synthesize address = _address;
@synthesize location = _location;

- (void)dealloc {
  [super dealloc];
}

- (CLLocationCoordinate2D) coordinate{
  return self.location;
}

- (NSString *)title {
  return self.address;
}
@end
