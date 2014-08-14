//
//  SearchViewController.m
//  FlickrSearch
//
//  Created by Andre Mietti on 13/08/14.
//  Copyright (c) 2014 Mietti. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

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
    
    
    //Adicionar gesto para sair o teclado.. ao tocar em outra parte da view
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tapRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendTextSearch:(id)sender {
    
    [self performSegueWithIdentifier:@"searchForResults" sender:nil];

    self.searchWordTextField.text = @"";
    [self.searchWordTextField resignFirstResponder];
}


#pragma mark - configuracoesTeclado
-(void)dismissKeyboard:(id)sender
{
    [self.searchWordTextField resignFirstResponder];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"searchForResults"]) {
     
        ResultsViewController *results = [segue destinationViewController];
        results.textParam = self.searchWordTextField.text;
    }
}


@end
