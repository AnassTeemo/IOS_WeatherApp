//
//  CityWeather.m
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 07/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
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
