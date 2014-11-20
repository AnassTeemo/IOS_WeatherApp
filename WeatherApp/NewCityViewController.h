//
//  NewCityViewController.h
//  WeatherApp
//
//  Created by Anass on 06/11/14.
//  Copyright (c) 2014 Anass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCityViewController : UIViewController

@property (strong, nonatomic) NSMutableSet *cities;
@property (strong, nonatomic) NSString *fileName;

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroudTap:(id)sender;
- (IBAction)DoneEditing:(id)sender;
@end
