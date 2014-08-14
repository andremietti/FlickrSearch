//
//  ResultsViewController.h
//  FlickrSearch
//
//  Created by Andre Mietti on 13/08/14.
//  Copyright (c) 2014 Mietti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrRequest.h"
#import "FlickrCollectionCell.h"
#import "ImageCache.h"
#import "FlickrPhoto.h"
#import "DetailViewController.h"
#import "SearchViewController.h"

@interface ResultsViewController : UIViewController

@property(weak, nonatomic)NSString *textParam;

@end
