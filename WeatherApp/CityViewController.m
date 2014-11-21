//
//  CityViewController.m
//  WeatherApp
//
//  Created by KHRIBECH & KHOULE on 06/11/14.
//  Copyright (c) 2014 KHRIBECH & KHOULE. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController ()

@end
@implementation CityViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title =[NSString stringWithString:self.name];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"bg1.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
 
    self.hourWeatherCollectionView.backgroundColor = [UIColor clearColor];
    self.weekWeatherCollectionView.backgroundColor = [UIColor clearColor];
    //self.cv.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    
    id dayWeather = [self.weekWeather objectAtIndex:0];
    
    self.labelTemperatureValue.text = [NSString stringWithFormat:@"%d°C",[dayWeather temperatureValue]];
    
    self.labelTemperatureMinMax.text = [NSString stringWithFormat:@"%d°/%d°",
                                        [dayWeather temperatureMin],
                                        [dayWeather temperatureMax]];
    
    self.labelCloudName.text = [NSString stringWithString:[dayWeather cloudName]];
    
    self.labelHumidity.text = [NSString stringWithFormat:@"%d%%",[dayWeather humidity]];
    
    self.labelWindSpeedDirection.text = [NSString stringWithFormat:@"%d mph %@",
                                         [dayWeather windSpeed],
                                         [dayWeather windDirection]];
                                          
    self.labelPrecipitationValueMode.text = [NSString stringWithString:[dayWeather precipitationMode]];
                                          
    self.labelPressure.text = [NSString stringWithFormat:@"%d hpa",[dayWeather pressure]];
    
    self.labelSunRise.text = [NSString stringWithString:[CityWeather sunRise]];
    
    self.labelSunSet.text = [NSString stringWithString:[CityWeather sunSet]];
    
    self.weatherIcon.image = [UIImage imageNamed:[dayWeather iconName]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark Collection View Methods
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.weekWeatherCollectionView){
    return [self.weekWeather count]-1;
    }
    return 5;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.hourWeatherCollectionView) {
        
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellHourlyWeather" forIndexPath:indexPath];
    
    UILabel *labelHour = (UILabel *)[cell viewWithTag:1];
    UILabel *labelTempareture = (UILabel *)[cell viewWithTag:3];
    UIImageView *icon = (UIImageView *)[cell viewWithTag:2];
    
    id hourlyWeather = [self.hourWeather objectAtIndex:indexPath.row];
    
    labelHour.text = [NSString stringWithFormat:@"%@h", [hourlyWeather dayValue]];
    labelTempareture.text = [NSString stringWithFormat:@"%d°", [hourlyWeather temperatureValue]];
    icon.image = [UIImage imageNamed:[hourlyWeather iconName]];
    
    return cell;
    }
    else if (collectionView == self.weekWeatherCollectionView){
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellDailyWeather" forIndexPath:indexPath];

        UILabel *labelDay = (UILabel *)[cell viewWithTag:1];
        UILabel *labelTempareture = (UILabel *)[cell viewWithTag:3];
        UIImageView *icon = (UIImageView *)[cell viewWithTag:2];
        
        id dayWeather = [self.weekWeather objectAtIndex:indexPath.row+1];
        
        labelDay.text = [NSString stringWithString:[dayWeather dayValue]];
        labelTempareture.text = [NSString stringWithFormat:@"%d°/%d°",
                                 [dayWeather temperatureMax],
                                 [dayWeather temperatureMin]];
        icon.image = [UIImage imageNamed:[dayWeather iconName]];        
        return cell;
    }
        return nil;
}


















@end
