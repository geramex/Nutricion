//
//  MyCell.m
//  Nutricion
//
//  Created by Robert Rodriguez on 01/05/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "MyCell.h"
#import "DietViewController.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
