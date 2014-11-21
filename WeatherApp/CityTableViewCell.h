//
//  CityTableViewCell.h
//  WeatherApp
//
//  Created by Anass on 20/11/14.
//  Copyright (c) 2014 Anass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelCloudName;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureValue;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureMax;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureMin;


@end
