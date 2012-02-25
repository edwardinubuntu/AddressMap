//
//  AMLocationsModel.h
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

/*
 Copyright (C) 2012 Edward Chiang
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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