//
//  AMMapViewController.m
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "AMMapViewController.h"
#import "MKMapView+Zoom.h"

@interface AMMapViewController ()

@end

@implementation AMMapViewController

@synthesize address = _address;
@synthesize locationModel = _locationModel;
@synthesize mapView = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    _address = [[NSString alloc] init];
  }
  return self;
}

- (id)initWithAddress:(NSString *)address {
  if (self = [self initWithNibName:nil bundle:nil]) {
    self.address = address;
  }
  return self;
}

- (void)dealloc {
  [_address release];
  [super dealloc];
}

- (void)loadView {
  [super loadView];
  self.title = self.address;
  _locationModel = [[AMLocationsModel alloc] initWithAddress:self.address];
  _locationModel.delegate = self;
  [_locationModel load];

  _mapView = [[MKMapView alloc] init];
  _mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  [self.view addSubview:_mapView];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.mapView.frame = self.view.frame;
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  [_locationModel release];
  [_mapView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark AMLocationsModelDelegate

- (void)locationsModel:(AMLocationsModel *)model loadDidFail:(id)object {
  // Do nothing
}

- (void)locationsModel:(AMLocationsModel *)model loadWithSuccess:(id)object {
  [_mapView addAnnotations:model.locationArray];
  if ([model.locationArray count] > 1) {
    [self flyMapToItems:_mapView];
  } else if ([model.locationArray count] == 1) {
    id<MKAnnotation> annotation = (id<MKAnnotation>)[model.locationArray objectAtIndex:0];
    [self.mapView setCenterCoordinate:annotation.coordinate zoomLevel:kMAPZOOMLEVEL animated:YES];
  }
  
}

#pragma mark -
#pragma mark private

- (void)flyMapToItems:(MKMapView *)mapView  {
  MKMapRect flyTo = MKMapRectNull;
  for (id<MKAnnotation> perItem in mapView.annotations) {
    // Count for Map Rect for display
    MKMapPoint annotationPoint = MKMapPointForCoordinate(perItem.coordinate);
    MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
    flyTo = MKMapRectUnion(flyTo, pointRect);
  }
  // Position the map so that all overlays and annotations are visible on screen.
  [mapView setVisibleMapRect:flyTo animated:YES];
}

@end
