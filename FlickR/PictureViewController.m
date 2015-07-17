//
//  PictureViewController.m
//  FlickR
//
//  Created by Antoine Galtier on 10/04/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import "PictureViewController.h"
#import "ReaderView.h"

@interface PictureViewController () <ReaderViewDelegate>

@property (weak, nonatomic) IBOutlet ReaderView *readerView;
@property (strong,nonatomic) NSArray * pictures;

@end

@implementation PictureViewController

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
    
//    FlickRLocation location;
//    location.latitude = 48.8462519;
//    location.longitude = 2.3857562;
//    location.radius = 5;
    
    UIActivityIndicatorView * indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = self.view.center;
    
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        self.pictures = [FlickRPicture picturesAroundLocation:self.location];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.readerView.delegate = self;
            [self.readerView displayPageAtIndex:0 animated:NO];
            [indicator stopAnimating];
        });
    });
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[self.readerView displayPageAtIndex:0 animated:NO];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    for (UIActivityIndicatorView * spinner in self.view.subviews) {
        spinner.center = self.view.center;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)numberOfPages
{
    return (int) self.pictures.count;
}

-(UIView *)pageAtIndex:(int)index
{
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = self.readerView.bounds;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.title = @"Chargement...";
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void){
        FlickRPicture * picture = self.pictures[index];
        NSData * imageData = [NSData dataWithContentsOfURL:picture.url];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            UIImage * image = [UIImage imageWithData:imageData];
            imageView.image = image;
            self.title = picture.title;
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
    
//    FlickRPicture * picture = self.pictures[index];
//    NSData * imageData = [NSData dataWithContentsOfURL:picture.url];
//    UIImage * image = [UIImage imageWithData:imageData];
    
    //[imageView setImage:image];
    
    return imageView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
