//
//  CityTableViewController.h
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 06/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "CityTableViewCell.h"

@interface CityTableViewController : UITableViewController{
     XMLParser *xmlParser;
}

@property (strong, nonatomic) NSMutableArray *cities;
@property (strong, nonatomic) NSMutableArray *citiesWeekWeather;
@property (strong, nonatomic) NSMutableArray *citiesHourWeather;
@property (strong, nonatomic) NSString *fileName;

- (void)getWeatherData:(id)city;
@end
