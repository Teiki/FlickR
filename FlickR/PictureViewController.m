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
    // Do any additional setup after loading the view.
    self.readerView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.readerView displayPageAtIndex:0 animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)numberOfPages
{
    return 4;
}

-(UIView *)pageAtIndex:(int)index
{
    NSString * imageName = [NSString stringWithFormat:@"%i.jpg",index];
    UIImage * image = [UIImage imageNamed:imageName];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.readerView.bounds;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
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
