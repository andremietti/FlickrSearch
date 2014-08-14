//
//  SearchViewController.h
//  FlickrSearch
//
//  Created by Andre Mietti on 13/08/14.
//  Copyright (c) 2014 Mietti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsViewController.h"

@interface SearchViewController : UIViewController

/// property for get text search
@property (weak, nonatomic) IBOutlet UITextField *searchWordTextField;

/// button for send param search
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end
