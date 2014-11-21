//
//  CityWeather.h
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 07/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityWeather : NSObject

//@property(nonatomic,strong) NSString *sunRise;
//@property(nonatomic,strong) NSString *sunSet;
@property(nonatomic,strong) NSString *dayValue;
@property(nonatomic) NSInteger temperatureValue;
@property(nonatomic) NSInteger temperatureMin;
@property(nonatomic) NSInteger temperatureMax;
@property(nonatomic) NSInteger humidity;
@property(nonatomic) NSInteger pressure;
@property(nonatomic) NSInteger windSpeed;
@property(nonatomic,strong) NSString *windDirection;
@property(nonatomic,strong) NSString *cloudName;
@property(nonatomic) NSInteger cloudValue;
@property(nonatomic,strong) NSString *precipitationMode;
@property(nonatomic) NSInteger precipitationValue;
@property(nonatomic,strong) NSString *iconName;

+(NSString *) sunRise;
+(void)setSunRise:(NSString *)newValue;
+(NSString *) sunSet;
+(void)setSunSet:(NSString *)newValue;

@end
