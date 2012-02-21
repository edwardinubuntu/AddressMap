//
//  AMLocationsModel.m
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "AMLocationsModel.h"
#import "NSString+Encode.h"
#import "JSONKit.h"
#import "AMLocationSpot.h"

@implementation AMLocationsModel

@synthesize address = _address;
@synthesize locationArray = _locationArray;
@synthesize delegate = _delegate;

- (id)init {
  if (self = [super init]) {
    _address = [[NSString alloc] init];
    _locationArray = [[NSMutableArray alloc] init];
  }
  return self;
}

- (id)initWithAddress:(NSString *)address {
  if (self = [self init ]) {
    self.address = address;
  }
  return self;
}

- (void)dealloc {
  [_locationArray release];
  [_address release];
  [super dealloc];
}

- (void)load {
  NSString *queryAPI = [NSString stringWithFormat:@"%@?address=%@&sensor=false", WEBSERVICE_SEARCH_STREETNAME, [self.address encodeString:NSUTF8StringEncoding]];
  NSURL *queryAPIURL = [NSURL URLWithString: queryAPI];
  NSLog(@"queryAPI %@", queryAPI);
  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:queryAPIURL];
  [request setDidFailSelector:@selector(asyncFail:)];
  [request setDidFinishSelector:@selector(asyncSuccess:)];
  [request setDelegate:self];
  [request startAsynchronous];
}

#pragma mark -
#pragma mark private

- (void)asyncFail:(id)object {
  if (self.delegate && [self.delegate respondsToSelector:@selector(locationsModel:loadDidFail:)]) {
    [self.delegate locationsModel:self loadDidFail:object];
  }
}

- (void)asyncSuccess:(id)object {
  ASIHTTPRequest *request = (ASIHTTPRequest*)object;
  NSString *response = [request responseString];
  NSDictionary *responseDictionary = [response objectFromJSONString];

  NSArray *results = [responseDictionary objectForKey:@"results"];
  for (NSDictionary *eachResult in results) {
    AMLocationSpot *locationSpot = [[AMLocationSpot alloc] init];
    locationSpot.address = [eachResult objectForKey:@"formatted_address"];
    NSDictionary *geometry = [eachResult objectForKey:@"geometry"];
    NSDictionary *location = [geometry objectForKey:@"location"];
    locationSpot.location = CLLocationCoordinate2DMake([[location objectForKey:@"lat"] floatValue], [[location objectForKey:@"lng"] floatValue]);
    [self.locationArray addObject:locationSpot];
    [locationSpot release];
  }
  if (self.delegate && [self.delegate respondsToSelector:@selector(locationsModel:loadWithSuccess:)]) {
    [self.delegate locationsModel:self loadWithSuccess:object];
  }
}

@end
