//
//  CityTableViewController.m
//  WeatherApp
//
//  Created by Anass on 06/11/14.
//  Copyright (c) 2014 Anass. All rights reserved.
//

#import "CityTableViewController.h"
#import "CityViewController.h"
#import "NewCityViewController.h"

@interface CityTableViewController ()

@end

@implementation CityTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    //[self.tableView setBackgroundView:bg];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    
    //file name to write the data to using the documents directory:
    self.fileName = [NSString stringWithFormat:@"%@/textfile.txt",libraryDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
     if (![fileManager fileExistsAtPath:self.fileName]) {
     NSLog(@"there is no file");
        
     }
     else{
         
     self.cities = [NSArray arrayWithContentsOfFile:self.fileName];
     }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.cities count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.cities objectAtIndex:indexPath.row];
    //cell.backgroundColor = [UIColor clearColor];
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.cities removeObjectAtIndex:indexPath.row];
        BOOL success = [self.cities writeToFile:self.fileName atomically:YES];
        if (!success)
            NSLog(@"Error writing in file");
        
        [tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[CityViewController class]]) {
        CityViewController *viewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSString *name = [self.cities objectAtIndex:indexPath.row];
        viewController.name = name;
    }
    else if ([segue.destinationViewController isKindOfClass:[NewCityViewController class]]){
        NewCityViewController *viewController = segue.destinationViewController;
        viewController.cities =[NSMutableSet setWithArray:self.cities];
        viewController.fileName = self.fileName;
    }
}


-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"I'm here %@",self.cities);
    [self.tableView reloadData];
}

- (IBAction)doneAddingEndForSegue:(UIStoryboardSegue *)returnSegue {
    NewCityViewController *viewController = returnSegue.sourceViewController;
    self.cities = [[viewController.cities allObjects] mutableCopy];
    
}

@end
