//
//  DetailViewController.m
//  FlickrSearch
//
//  Created by Andre Mietti on 13/08/14.
//  Copyright (c) 2014 Mietti. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [self loadLargeImage];
}

/**
 *  Method for load and show large image with object large url 
 */

-(void)loadLargeImage
{
    ImageCache *imageCache = [ImageCache sharedCache];
    [imageCache fetchImageWithURL:self.flickrPhoto.largeURL withCompletionBlock:^(UIImage *image) {
        self.imageView.image = image;
    }];
    
    self.labelNameImage.text = self.flickrPhoto.title;
    
    if (self.flickrPhoto.largeURL == NULL) {
        self.labelLargeImage.text = @"No large image...";
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
