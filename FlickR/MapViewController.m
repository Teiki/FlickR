//
//  MapViewController.m
//  FlickR
//
//  Created by Antoine Galtier on 16/05/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import "MapViewController.h"
#import "City+CRUD.h"
@import MapKit;

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView * mapView;

@property (weak, nonatomic) IBOutlet UILabel * coordinateLabel;


@end

@implementation MapViewController

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
    
    self.mapView.delegate = self;
    
    self.coordinateLabel.text = [NSString stringWithFormat:@"Lat : %f // Lon : %f", self.mapView.centerCoordinate.latitude,self.mapView.centerCoordinate.longitude];
    
    // Do any additional setup after loading the view.
}

- (IBAction)addLocation:(id)sender {
    
    City * new_city = [City newCity];
    new_city.latitude = @(self.mapView.centerCoordinate.latitude);
    new_city.longitude = @(self.mapView.centerCoordinate.longitude);
    
    [City saveChanges];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    self.coordinateLabel.text = [NSString stringWithFormat:@"Lat : %f // Lon : %f", self.mapView.centerCoordinate.latitude,self.mapView.centerCoordinate.longitude];
}

@end
