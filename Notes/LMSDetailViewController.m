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
    self.noteDescriptionLabel.text = _descriptionText;
    self.noteTitleLabel.text = _titleText;
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
-(void) setViewLocation:(CLLocation*)currentlocation
{

}
@end
