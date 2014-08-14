//
//  ImageCache.m
//  FlickrViewer
//
//  Created by andre mietti on 1/20/14.
//  Copyright (c) 2014 BEPID. All rights reserved.
//

#import "ImageCache.h"

@interface ImageCache()
@property(nonatomic, strong)NSMutableDictionary *cache;
@property(nonatomic, strong)NSOperationQueue *queue;
@property(nonatomic, strong)NSMutableDictionary *operationCache;
@end

@implementation ImageCache


#pragma mark - Singleton
static ImageCache *_sharedCache;

+(ImageCache *)sharedCache
{
    if (!_sharedCache) {
        _sharedCache = [[super allocWithZone:nil]init];
    }
    return _sharedCache;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [ImageCache sharedCache];
}
-(id)init
{
    self = [super init];
    if (self) {
        self.cache = [[NSMutableDictionary alloc]init];
        self.queue = [[NSOperationQueue alloc]init];
        self.operationCache = [[NSMutableDictionary alloc]init];
    }
    return self;
}


-(void)cancelImageDownloadWithURL:(NSString *)url withCompletionBlock:(void (^)(void))block
{
    NSBlockOperation *blockOperation = self.operationCache[url];
    if (blockOperation) {
        [blockOperation cancel];
        block();
    }
}


-(void)fetchImageWithURL:(NSString *)url withCompletionBlock:(void(^)(UIImage *image))block
{
    UIImage *cacheImage = self.cache[url];
    if (cacheImage) {
        block(cacheImage);
        
    }else{
        NSBlockOperation *retrievelBlock = [[ NSBlockOperation alloc]init];
        
        __weak NSBlockOperation *weakOperation = retrievelBlock;
        
        [retrievelBlock addExecutionBlock:^{
            NSURL *imageURL = [NSURL URLWithString:url];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];

            if (image) {
                [self.cache setObject:image forKey:url];
            }
            
            //main
            if (![weakOperation isCancelled]) {
                NSBlockOperation *completionBlock = [[NSBlockOperation alloc]init];
                
                [completionBlock addExecutionBlock:^{
                    block(image);
                }];
                [[NSOperationQueue mainQueue]addOperation:completionBlock];
                
            }
        }];
        
            
        if (retrievelBlock && url) {
            [self.operationCache setObject:retrievelBlock forKey:url];
            [self.queue addOperation:retrievelBlock];
        }
}
}



@end
