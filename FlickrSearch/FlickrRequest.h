//
//  FlickrRequest.h
//  FlickrViewer
//
//  Created by andre mietti on 1/20/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FlickrRequest;

@protocol FlickrRequestDelegate

-(void)request:(FlickrRequest *)request finishWithResults: (NSArray *) photoList;

-(void)request:(FlickrRequest *)request finishWithError:(NSError *)error;

@end

@interface FlickrRequest : NSObject

@property (nonatomic, weak) id<FlickrRequestDelegate>delegate;

-(void)requestFlickrPhotos:(id<FlickrRequestDelegate>)delegate forTag:(NSString *)searchParameter;

@end
