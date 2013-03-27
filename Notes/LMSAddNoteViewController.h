//
//  LMSAddNoteViewController.h
//  Notes
//
//  Created by Lauren Shapiro on 3/26/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSAddNoteViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleInputField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionInputField;

@end
