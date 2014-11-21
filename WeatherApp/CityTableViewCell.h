//
//  CityTableViewCell.h
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 20/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelCloudName;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureValue;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureMax;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureMin;


@end
