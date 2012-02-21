//
//  AMLocationsModel.h
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "AMAtlas.h"

@protocol AMLocationsModelDelegate;

@interface AMLocationsModel : NSObject

@property (nonatomic, assign) id<AMLocationsModelDelegate> delegate;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, retain) NSMutableArray *locationArray;
           
- (id)initWithAddress:(NSString*)address;
- (void)load;

@end


@protocol AMLocationsModelDelegate
@optional
- (void)locationsModel:(AMLocationsModel *)model loadDidFail:(id)object;
- (void)locationsModel:(AMLocationsModel *)model loadWithSuccess:(id)object;
@end