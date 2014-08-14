//
//  FlickrPhoto.h
//  FlickrViewer
//
//  Created by andre mietti on 1/20/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPhoto : NSObject

@property(nonatomic, strong) NSString *identifier;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *thumbnailURL;
@property(nonatomic, strong) NSString *largeURL;

+(FlickrPhoto *) photoWithDictionary:(NSDictionary*)dictionary;

@end
