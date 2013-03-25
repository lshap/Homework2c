//
//  Location.h
//  Notes
//
//  Created by Lauren Shapiro on 3/25/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Note;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) Note *parentnote;

@end
