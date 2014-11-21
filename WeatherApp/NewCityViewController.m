//
//  NewCityViewController.m
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 06/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
//

#import "NewCityViewController.h"
#import "CityTableViewController.h"

@interface NewCityViewController ()

@end

@implementation NewCityViewController

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}*/


- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroudTap:(id)sender {
    [self.textField resignFirstResponder];
}


- (IBAction)DoneEditing:(id)sender {
    
    if (![self.cities containsObject:[self.textField.text capitalizedString]]) {
        [self.cities addObject:[self.textField.text capitalizedString]];
    }
    NSLog(@"array: %@",self.cities);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
        
    BOOL success = [self.cities writeToFile:self.fileName atomically:YES];
    if (!success) {
            NSLog(@"Error writing in file");
    }

   
}
@end
