//
//  FlickrPhoto.m
//  FlickrViewer
//
//  Created by andre mietti on 1/20/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

+(FlickrPhoto *) photoWithDictionary:(NSDictionary*)dictionary
{
    FlickrPhoto *photo = [[FlickrPhoto alloc]init];
    
    photo.identifier = dictionary[@"id"];
    photo.title = dictionary[@"title"];
    photo.thumbnailURL = dictionary[@"url_t"];
    photo.largeURL = dictionary[@"url_l"];

    return photo;
}

@end
