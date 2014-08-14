//
//  FlickrRequest.m
//  FlickrViewer
//
//  Created by andre mietti on 1/20/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//


/// APP FlickrViewer
/// API Key f395dee7df1ccd41f707a0de0158eef3
/// Secret 07e6b0c5ae60534a


#import "FlickrRequest.h"
#import "FlickrPhoto.h"
#define API_KEY @"f395dee7df1ccd41f707a0de0158eef3"

@interface FlickrRequest()<NSURLConnectionDataDelegate>

@property(nonatomic, strong)NSMutableData *responseData;
@end

@implementation FlickrRequest

-(void)requestFlickrPhotos:(id<FlickrRequestDelegate>)delegate forTag:(NSString *)searchParameter
{
    NSString *flickrURLString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&text=%@&per_page=50&format=json&extras=url_t,url_l&nojsoncallback=1",API_KEY, searchParameter];
    self.delegate = delegate;
    
    NSURL *flickrURL = [NSURL URLWithString:flickrURLString];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:flickrURL];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}

#pragma mark -NSURLConnection Delegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.responseData = [[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError* error;
    NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&error];
    if (error) {
        [self.delegate request:self finishWithError:error];
    }else{
        NSMutableArray *photoList = [NSMutableArray array];
        NSArray *photosJSONInfo = jsonData[@"photos"][@"photo"];
        
        if (photosJSONInfo && [photosJSONInfo count]) {
            for (NSDictionary *photoJSONInfo in photosJSONInfo) {
                FlickrPhoto *photo = [FlickrPhoto photoWithDictionary:photoJSONInfo];
                [photoList addObject:photo];
            }
        }
        [self.delegate request:self finishWithResults:photoList];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.delegate request:self finishWithError:error];
}

@end
