//
//  LMSLocation.h
//  Notes
//
//  Created by Lauren Shapiro on 3/24/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@interface LMSLocation : NSManagedObject
@property(strong, nonatomic)CLLocation* location;
@end
