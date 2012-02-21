//
//  ViewController.m
//  AddressMap
//
//  Created by Edward Chiang on 12/2/21.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "DemoViewController.h"
#import "AMAtlas.h"
#import "AMMapViewController.h"

@interface DemoViewController ()
- (void)search:(id)object;
@end

@implementation DemoViewController

@synthesize addressLabel = _addressLabel;
@synthesize searchButton = _searchButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}


- (void)loadView {
  [super loadView];
  _addressLabel = [[UILabel alloc] init];
  _addressLabel.text = kADDRESS;
  [_addressLabel setBackgroundColor:[UIColor clearColor]];
  [_addressLabel sizeToFit];
  _addressLabel.center = self.view.center;
  [self.view addSubview:_addressLabel];

  _searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [_searchButton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
  [_searchButton setTitle:@"Search" forState:UIControlStateNormal];
  [_searchButton sizeToFit];
  _searchButton.frame = CGRectMake( (self.view.bounds.size.width - self.searchButton.bounds.size.width ) / 2, self.view.bounds.size.height / 2 + 50.f, self.searchButton.bounds.size.width, self.searchButton.bounds.size.height);  [self.view addSubview:self.searchButton];

  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  [_addressLabel  release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark private

- (void)search:(id)object {
  AMMapViewController *mapViewController = [[AMMapViewController alloc] initWithAddress:self.addressLabel.text];
  [self.navigationController pushViewController:mapViewController animated:YES];
  [mapViewController release];
}

@end
