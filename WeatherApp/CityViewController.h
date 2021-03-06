//
//  CityViewController.h
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 06/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface CityViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    XMLParser *xmlParser;
}

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *weekWeather;
@property (strong, nonatomic) NSArray *hourWeather;

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureValue;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperatureMinMax;
@property (weak, nonatomic) IBOutlet UILabel *labelCloudName;
@property (weak, nonatomic) IBOutlet UILabel *labelHumidity;
@property (weak, nonatomic) IBOutlet UILabel *labelWindSpeedDirection;
@property (weak, nonatomic) IBOutlet UILabel *labelPrecipitationValueMode;
@property (weak, nonatomic) IBOutlet UILabel *labelPressure;
@property (weak, nonatomic) IBOutlet UILabel *labelSunRise;
@property (weak, nonatomic) IBOutlet UILabel *labelSunSet;
@property (weak, nonatomic) IBOutlet UICollectionView *hourWeatherCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *weekWeatherCollectionView;




@end
