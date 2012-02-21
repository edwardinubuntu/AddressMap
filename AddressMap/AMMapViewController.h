//
//  AMMapViewController.h
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AMLocationsModel.h"

@interface AMMapViewController : UIViewController <AMLocationsModelDelegate>

@property (nonatomic, copy) NSString *address;
@property (nonatomic, retain) AMLocationsModel *locationModel;
@property (nonatomic, retain) MKMapView *mapView;

- (id)initWithAddress:(NSString*)address;

@end
