//
//  LMSAddNoteViewController.m
//  Notes
//
//  Created by Lauren Shapiro on 3/26/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSAddNoteViewController.h"

@interface LMSAddNoteViewController ()

@end

@implementation LMSAddNoteViewController

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
	// Do any additional setup after loading the view.
    
    self.titleInputField.delegate = self;
    self.descriptionInputField.delegate = self;
    
    
    self.titleLabel.font = [UIFont fontWithName:@"Avenir" size:20];
    self.descriptionLabel.font = [UIFont fontWithName:@"Avenir" size:20];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.titleInputField resignFirstResponder];
    [self.descriptionInputField resignFirstResponder];
    return NO;
}

-(void)dismissKeyboard {
    [self.titleInputField resignFirstResponder];
    [self.descriptionInputField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
