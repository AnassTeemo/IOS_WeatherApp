//
//  CityViewController.m
//  WeatherApp
//
//  Created by Anass on 06/11/14.
//  Copyright (c) 2014 Anass. All rights reserved.
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
    // Do any additional setup after loading the view.
    /*NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Paris&mode=xml&lang=fr"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    if (error == nil)
    {
        NSLog(@"%@",data);
    }
    [self.labelField setText:self.name];*/
    
    self.navigationItem.title =[NSString stringWithString:self.name];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
 
    self.cv.backgroundColor = [UIColor clearColor];
    self.cv2.backgroundColor = [UIColor clearColor];
    //self.cv.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    
    xmlParser = [XMLParser new];
    NSString *urlstring = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&mode=xml&units=metric&cnt=7",self.name];
	
	NSURL *url = [NSURL URLWithString:urlstring];
	
	cityweather = [NSArray arrayWithArray:[xmlParser parseWeekWeather:url]];
    
    self.labelTemperatureValue.text = [NSString stringWithFormat:@"%d°C",
                                       [[cityweather objectAtIndex:0] temperatureValue]];
    
    self.labelTemperatureMinMax.text = [NSString stringWithFormat:@"%d/%d°C",
                                        [[cityweather objectAtIndex:0] temperatureMin],
                                        [[cityweather objectAtIndex:0] temperatureMax]];
    
    self.labelCloudName.text = [NSString stringWithString:
                                [[cityweather objectAtIndex:0] cloudName]];
    
    self.labelHumidity.text = [NSString stringWithFormat:@"%d%%",
                               [[cityweather objectAtIndex:0] humidity]];
    
    self.labelWindSpeedDirection.text = [NSString stringWithFormat:@"%d mph %@",
                                         [[cityweather objectAtIndex:0] windSpeed],
                                         [[cityweather objectAtIndex:0] windDirection]];
                                          
    //self.labelPrecipitationValueMode.text = [NSString stringWithString:[[cityweather objectAtIndex:0] precipitationMode]];
                                          
    self.labelPressure.text = [NSString stringWithFormat:@"%d hpa",
                               [[cityweather objectAtIndex:0] pressure]];
    
    self.labelSunRise.text = [NSString stringWithString:
                              [CityWeather sunRise]];
    
    self.labelSunSet.text = [NSString stringWithString:
                             [CityWeather sunSet]];
    
    self.weatherIcon.image = [UIImage imageNamed:
                             [[cityweather objectAtIndex:0] iconName]];
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
    if (collectionView == self.cv2){
    return [cityweather count]-1;
    }
    return 5;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.cv) {
        
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellHourlyWeather" forIndexPath:indexPath];
    
    UILabel *labelHour = (UILabel *)[cell viewWithTag:1];
    UILabel *labelTempareture = (UILabel *)[cell viewWithTag:3];
    UIImageView *icon = (UIImageView *)[cell viewWithTag:2];
    
    labelHour.text = @"12am";
    labelTempareture.text = @"45°";
    icon.image = [UIImage imageNamed:
                  [[cityweather objectAtIndex:3] iconName]];
    
    return cell;
    }
    else if (collectionView == self.cv2){
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellDailyWeather" forIndexPath:indexPath];

        UILabel *labelDay = (UILabel *)[cell viewWithTag:1];
        UILabel *labelTempareture = (UILabel *)[cell viewWithTag:3];
        UIImageView *icon = (UIImageView *)[cell viewWithTag:2];
        
        labelDay.text = [NSString stringWithString:[[cityweather objectAtIndex:indexPath.row+1] dayValue]];
        labelTempareture.text = [NSString stringWithFormat:@"%d°/%d°",
                                 [[cityweather objectAtIndex:indexPath.row+1] temperatureMax],
                                 [[cityweather objectAtIndex:indexPath.row+1] temperatureMin]];
        icon.image = [UIImage imageNamed:
                      [[cityweather objectAtIndex:indexPath.row+1] iconName]];
        
        return cell;
    }
        return nil;
}


















@end
