//
//  ResultsViewController.m
//  FlickrSearch
//
//  Created by Andre Mietti on 13/08/14.
//  Copyright (c) 2014 Mietti. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()<FlickrRequestDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong)IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *photoList;

@end

@implementation ResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FlickrRequest *request = [[FlickrRequest alloc]init];
    [request requestFlickrPhotos:self forTag:[NSString stringWithFormat:@"%@", self.textParam]];
    
    SearchViewController *search = [[SearchViewController alloc]init];
//    search.searchWordTextField.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - FlickrRequestDelegate

-(void)request:(FlickrRequest *)request finishWithResults:(NSArray *)photoList
{
    self.photoList = photoList;
    [self.collectionView reloadData];
}

-(void)request:(FlickrRequest *)request finishWithError:(NSError *)error
{
    NSLog(@"ERRO: %@", [error localizedDescription]);
}


#pragma mark - Data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photoList count];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell* )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlickrCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"flickrCell" forIndexPath:indexPath];
    
    FlickrPhoto *photo = self.photoList[indexPath.row];
    ImageCache *imageCache = [ImageCache sharedCache];
    [imageCache fetchImageWithURL:photo.thumbnailURL withCompletionBlock:^(UIImage *image) {
        cell.flickrPhoto.image = image;
        
    }];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCache *cache = [ImageCache sharedCache];
    
    FlickrPhoto *photo = self.photoList[indexPath.row];
    [cache cancelImageDownloadWithURL:photo.thumbnailURL withCompletionBlock:^{
        
    }];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlickrPhoto *photo = self.photoList[indexPath.row];
    
    [self performSegueWithIdentifier:@"resultsForDetail" sender:photo];
    
}


#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"resultsForDetail"]) {
        
        DetailViewController *detalhes = [segue destinationViewController];
        detalhes.flickrPhoto = sender;
    }
    
}


@end
