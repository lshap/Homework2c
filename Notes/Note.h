//
//  Note.h
//  Notes
//
//  Created by Lauren Shapiro on 3/25/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * note_description;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Location *location;

@end
