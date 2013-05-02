//
//  DietViewController.h
//  Nutricion
//
//  Created by Robert Rodriguez on 01/05/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMCalendar.h"

@interface DietViewController : UIViewController
@property (strong, nonatomic) IBOutlet UINavigationBar *Navbar;
@property (strong, nonatomic) IBOutlet UILabel *diet;
- (IBAction)Back1:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic, strong) PMPeriod *period1;

@property (strong,nonatomic) NSMutableArray *horas;

@end
