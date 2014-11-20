//
//  CityWeather.m
//  WeatherApp
//
//  Created by Anass on 07/11/14.
//  Copyright (c) 2014 Anass. All rights reserved.
//

#import "CityWeather.h"

@implementation CityWeather

static NSString *sunRise;
static NSString *sunSet;

+(NSString *) sunRise {
    return sunRise;
}
+(void)setSunRise:(NSString *)newValue {
    sunRise = newValue;
}
+(NSString *) sunSet {
    return sunSet;
}
+(void)setSunSet:(NSString *)newValue {
    sunSet = newValue;
}
@end
