//
//  CityTableViewCell.m
//  WeatherApp
//
//  Created by Anass on 20/11/14.
//  Copyright (c) 2014 Anass. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
