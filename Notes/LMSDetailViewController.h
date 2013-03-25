//
//  LMSDetailViewController.h
//  Notes
//
//  Created by Lauren Shapiro on 3/23/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LMSLocation.h"

@interface LMSDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *noteDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSString* descriptionText;
@property (strong, nonatomic) NSString* titleText;
//@property (strong, nonatomic) CLLocation* location;
@property CLLocationCoordinate2D coord;
@property double latitude;
@property double longitude;

-(void) setDescriptionText:(NSString*)description;
-(void) setTitleText:(NSString*)titletext;
-(void) setLatitude:(double)currentlatitude;
-(void) setLongitude:(double)currentlongitude;
@end
