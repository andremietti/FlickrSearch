//
//  DetalhesViewController.m
//  FlickrViewer
//
//  Created by Andre Mietti on 8/12/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//

#import "DetalhesViewController.h"

@interface DetalhesViewController ()

@end

@implementation DetalhesViewController

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
    
    
    ImageCache *imageCache = [ImageCache sharedCache];
    [imageCache fetchImageWithURL:self.flickrPhoto.largeURL withCompletionBlock:^(UIImage *image) {
        self.imageView.image = image;
    }];

    NSLog(@"Foto passada: %@", self.flickrPhoto.largeURL);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
