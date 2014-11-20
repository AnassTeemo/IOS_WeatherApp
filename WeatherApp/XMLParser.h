//
//  XMLParser.h
//  WeatherApp
//
//  Created by Anass on 07/11/14.
//  Copyright (c) 2014 Anass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityWeather.h"

@interface XMLParser : NSObject <NSXMLParserDelegate>
{
	NSString		*current;
    CityWeather     *weatherCondition;
    NSMutableArray  *weatherConditions;

    NSXMLParser     *weekParser;
    NSXMLParser     *hourlyParser;
}
- (NSMutableArray *) parseWeekWeather: (NSURL *) url;
- (NSMutableArray *) parseHourlyWeather: (NSURL *) url;
@end