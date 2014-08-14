//
//  DetalhesViewController.h
//  FlickrViewer
//
//  Created by Andre Mietti on 8/12/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhoto.h"
#import "ImageCache.h"
#import "FlickrRequest.h"

@interface DetalhesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic, strong)FlickrPhoto *flickrPhoto;

@end
