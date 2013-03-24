//
//  LMSNote.h
//  Notes
//
//  Created by Lauren Shapiro on 3/23/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMSNote : NSManagedObject
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* note_description;
@end
