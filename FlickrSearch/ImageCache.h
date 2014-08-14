//
//  ImageCache.h
//  FlickrViewer
//
//  Created by andre mietti on 1/20/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject

+(ImageCache *)sharedCache;

-(void)fetchImageWithURL:(NSString *)url withCompletionBlock:(void(^)(UIImage *image))block;

-(void)cancelImageDownloadWithURL:(NSString *)url withCompletionBlock:(void (^)(void))block;

@end
