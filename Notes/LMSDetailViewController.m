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
    self.noteDescriptionLabel.font =  [UIFont fontWithName:@"Avenir" size:20];
    self.noteTitleLabel.font =  [UIFont fontWithName:@"Avenir" size:25];
    
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

-(void) setViewCoordinate:(CLLocationCoordinate2D) newcoord{
    
    self.coord = newcoord;
}

- (void)addPinToMapAtLocation:(CLLocationCoordinate2D)location
{
    MKPointAnnotation* pin = [[MKPointAnnotation alloc]init];
    
    pin.coordinate = self.coord;
    [self.mapView addAnnotation:pin];
    
       MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.coord, 1000, 1000);
    [self.mapView setRegion:region];
    [self.mapView setCenterCoordinate: pin.coordinate animated: YES];
    [self.mapView reloadInputViews];
}


@end
