//
//  XMLParser.m
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 07/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

- (NSMutableArray *)parseWeekWeather: (NSURL *) url
{
    weatherConditions = [NSMutableArray new];
	
    weekParser = [[NSXMLParser alloc] initWithContentsOfURL: url];
    
    [weekParser setDelegate: self];
	[weekParser parse];
	
	return weatherConditions;
}

- (NSMutableArray *)parseHourlyWeather:(NSURL *)url{
    
    weatherConditions = [NSMutableArray new];
    
    hourlyParser = [[NSXMLParser alloc] initWithContentsOfURL: url];
    [hourlyParser setDelegate: self];
	[hourlyParser parse];
	
	return weatherConditions;

}

+ (NSString *)dayFromDate:(NSString *)dateString{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* myDate = [dateFormatter dateFromString:dateString];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE"];
    NSString *stringFromDate = [formatter stringFromDate:myDate];
    
   // NSLog(@"%@", stringFromDate);
    return stringFromDate;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict
{
    if (qName) elementName = qName;
	if (elementName) current = [NSString stringWithString:elementName];
    
    if ([current isEqualToString:@"sun"]) {
        [CityWeather setSunRise:
         [[attributeDict valueForKey:@"rise"] substringWithRange:NSMakeRange(11,5)]];
        [CityWeather setSunSet:
         [[attributeDict valueForKey:@"set"] substringWithRange:NSMakeRange(11,5)]];
    }
    else if ([current isEqualToString:@"time"]) {
        weatherCondition = [CityWeather new];
        if (parser == weekParser){
            NSString *str = [NSString stringWithString:[attributeDict valueForKey:@"day"]];
            weatherCondition.dayValue = [XMLParser dayFromDate:str];
            //NSLog(@"%@", weatherCondition.dayValue);
        }
        else{
            weatherCondition.dayValue = [[attributeDict valueForKey:@"from"] substringWithRange:NSMakeRange(11,2)];
            //[NSString stringWithString:[attributeDict valueForKey:@"from"]];
        }
    }
    else if ([current isEqualToString:@"symbol"]) {
        weatherCondition.iconName = [NSString stringWithString:[attributeDict valueForKey:@"var"]];
    }
    else if ([current isEqualToString:@"precipitation"]) {
        if ([attributeDict count] > 0) {
        weatherCondition.precipitationMode = [NSString stringWithString:[attributeDict valueForKey:@"type"]];
        //weatherCondition.precipitationValue = [[NSString stringWithString:[attributeDict valueForKey:@"value"]] integerValue];
    }
        else
            weatherCondition.precipitationMode = @"No rain";
    }
    else if ([current isEqualToString:@"windDirection"]) {
        weatherCondition.windDirection = [NSString stringWithString:[attributeDict valueForKey:@"code"]];
    }
    else if ([current isEqualToString:@"windSpeed"]) {
        weatherCondition.windSpeed = [[NSString stringWithString:[attributeDict valueForKey:@"mps"]] integerValue];
    }
    else if ([current isEqualToString:@"temperature"]) {
        if (parser == weekParser){
            weatherCondition.temperatureValue = [[NSString stringWithString:[attributeDict valueForKey:@"day"]] integerValue];
        }
        else{
             weatherCondition.temperatureValue = [[NSString stringWithString:[attributeDict valueForKey:@"value"]] integerValue];
        }
        weatherCondition.temperatureMin = [[NSString stringWithString:[attributeDict valueForKey:@"min"]] integerValue];
        weatherCondition.temperatureMax = [[NSString stringWithString:[attributeDict valueForKey:@"max"]] integerValue];
    }
    else if ([current isEqualToString:@"pressure"]) {
        weatherCondition.pressure = [[NSString stringWithString:[attributeDict valueForKey:@"value"]] integerValue];
    }
    else if ([current isEqualToString:@"humidity"]) {
        weatherCondition.humidity = [[NSString stringWithString:[attributeDict valueForKey:@"value"]] integerValue];
    }
    else if ([current isEqualToString:@"clouds"]) {
        //weatherCondition.cloudValue = [[NSString stringWithString:[attributeDict valueForKey:@"value"]] integerValue];
        weatherCondition.cloudName = [NSString stringWithString:[attributeDict valueForKey:@"value"]];
    }
    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
	if ([elementName isEqualToString:@"time"]){
        [weatherConditions addObject:weatherCondition];
        if (parser == hourlyParser && [weatherConditions count] == 5){
            [parser abortParsing];
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (!current) return;
}

-(void) parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"parserDidStartDocument");
}

-(void) parserDidEndDocument: (NSXMLParser *)parser {
	NSLog(@"parserDidEndDocument %d", [weatherConditions count]);
}

@end
