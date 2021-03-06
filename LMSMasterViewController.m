//
//  LMSMasterViewController.m
//  Notes
//
//  Created by Lauren Shapiro on 3/23/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSMasterViewController.h"

@interface LMSMasterViewController ()
@property (strong, nonatomic) NSMutableArray *notes;
@property (strong, nonatomic) NSMutableArray *locations;
@end

@implementation LMSMasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView.delegate = self;
    _notes = [[NSMutableArray alloc]init];
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    _locationManager.delegate = self;
    
       [self updateTableData];
    
    self.title = @"Notes";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)locationManager:(CLLocationManager*) manager didUpdateLocations:(NSArray*) locations
{
    self.lastLocation = [locations lastObject];
}


#pragma mark - Segue Methods
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"showDetailView"]){
        LMSDetailViewController* detailViewController = [segue destinationViewController];
        
        NSIndexPath *currpath = [[NSIndexPath alloc]init];
        currpath = self.tableView.indexPathForSelectedRow;

        Note *currnote = _notes[currpath.row];
       [ detailViewController setTitleText: currnote.title];
       [detailViewController setDescriptionText: currnote.note_description];

        CLLocationDegrees lat = currnote.location.latitude.doubleValue;
        CLLocationDegrees lon = currnote.location.longitude.doubleValue;
        CLLocationCoordinate2D coord =  CLLocationCoordinate2DMake(lat,lon);
    [detailViewController setViewCoordinate: coord];
    }
    
    else
    {
        [self.locationManager startUpdatingLocation];
    }
}

-(IBAction)unwindFromAddNoteViewWithAdd:(UIStoryboardSegue *)segue {
    LMSAddNoteViewController* vc = [segue sourceViewController];
    NSString* newnotetitle = vc.titleInputField.text;
    NSString* newnotedescription = vc.descriptionInputField.text;
    
    NSNumber* newlatitude = [NSNumber numberWithDouble:self.lastLocation.coordinate.latitude];
    NSNumber* newlongitude = [NSNumber numberWithDouble:self.lastLocation.coordinate.longitude];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    Note *note = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Note"
                  inManagedObjectContext:context];
    [note setValue: newnotetitle forKey:@"title"];
    [note setValue: newnotedescription forKey:@"note_description"];
    LMSLocation *testlocation = [NSEntityDescription
                                 insertNewObjectForEntityForName:@"Location"
                                 inManagedObjectContext:context];
    [testlocation setValue:newlatitude forKey:@"latitude"];
    [testlocation setValue:newlongitude forKey:@"longitude"];
    [testlocation setValue:note forKey:@"parentnote"];
    [note setValue:testlocation forKey:@"location"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    [self.locationManager stopUpdatingLocation];
    [self updateTableData];
    [self.tableView reloadData];
}

-(IBAction)unwindFromAddNoteViewWithCancel:(UIStoryboardSegue *)segue {
    
}

-(IBAction)unwindFromDetailView:(UIStoryboardSegue *)segue {
    
}

#pragma mark - Table view data source

-(void)updateTableData
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Note" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.notes = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Set up the cell...
    Note *info = [_notes objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:20];
    
    cell.textLabel.text = info.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",
                                 info.title];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
