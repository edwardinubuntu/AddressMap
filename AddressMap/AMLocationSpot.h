//
//  AMLocationSpot.h
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AMLocationSpot : NSObject {
@private
  CLLocationCoordinate2D _location;
  NSString *_address;
}

@property (nonatomic, assign) CLLocationCoordinate2D location;
@property (nonatomic, copy) NSString *address;
@end
