//
//  LMSDetailViewController.m
//  Notes
//
//  Created by Lauren Shapiro on 3/23/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSDetailViewController.h"

@interface LMSDetailViewController ()

@end

@implementation LMSDetailViewController

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
    self.noteDescriptionLabel.text = _descriptionText;
    self.noteTitleLabel.text = _titleText;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self addPinToMapAtLocation:self.coord];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) setDescriptionText:(NSString*)description
{
  _descriptionText = description;
}
-(void) setTitleText:(NSString*)titletext
{
    _titleText = titletext;
}
//-(void) setViewLocation:(LMSLocation*)currentlocation
//{
//    MKMapPoint point = MKMapPointMake(currentlocation.latitude, currentlocation.longitude);
//   _coord = MKCoordinateForMapPoint(point);
//    
//}

-(void) setLatitude:(double)currentlatitude{
    self.latitude = currentlatitude;
}
-(void) setLongitude:(double)currentlongitude{
    self.longitude = currentlongitude;
}

//
//- (void)addPinToMapAtLocation:(CLLocation *)location
- (void)addPinToMapAtLocation:(CLLocationCoordinate2D)location
{
     NSLog(@"Location Latitude in DetailView: %f", location.latitude);
     NSLog(@"Location Longitude in DetailView: %f", location.longitude);
    MKPointAnnotation* pin = [[MKPointAnnotation alloc]init];
//    pin.coordinate = self.location.coordinate;
    pin.coordinate = self.coord;
    [self.mapView addAnnotation:pin];
//    
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.location.coordinate, 1000, 1000);
       MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.coord, 1000, 1000);
    [self.mapView setRegion:region];
    [self.mapView setCenterCoordinate: pin.coordinate animated: YES];
    [self.mapView reloadInputViews];
}


@end
