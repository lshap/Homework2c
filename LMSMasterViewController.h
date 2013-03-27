//
//  LMSMasterViewController.h
//  Notes
//
//  Created by Lauren Shapiro on 3/23/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Note.h"
#import "Location.h"
#import "LMSDetailViewController.h"
#import "LMSAddNoteViewController.h"

@interface LMSMasterViewController : UITableViewController
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation* lastLocation;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end
