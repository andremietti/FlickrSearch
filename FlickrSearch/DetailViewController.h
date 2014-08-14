//
//  DetailViewController.h
//  FlickrSearch
//
//  Created by Andre Mietti on 13/08/14.
//  Copyright (c) 2014 Mietti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
#import "ImageCache.h"
#import "FlickrRequest.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelLargeImage;
@property (weak, nonatomic) IBOutlet UILabel *labelNameImage;

@property(nonatomic, strong)FlickrPhoto *flickrPhoto;


@end
