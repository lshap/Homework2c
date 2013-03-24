//
//  LMSDetailViewController.h
//  Notes
//
//  Created by Lauren Shapiro on 3/23/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LMSDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *noteDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSString* descriptionText;
@property (strong, nonatomic) NSString* titleText;

-(void) setDescriptionText:(NSString*)description;
-(void) setTitleText:(NSString*)titletext;
-(void) setViewLocation:(CLLocation*)currentlocation;
@end
