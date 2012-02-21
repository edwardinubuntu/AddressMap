//
//  DemoViewController.h
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController <
  UITextFieldDelegate
>

@property (nonatomic, retain) UITextField *addressView;
@property (nonatomic, retain) UIButton *searchButton;

@end
