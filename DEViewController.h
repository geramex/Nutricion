//
//  DEViewController.h
//  Nutricion
//
//  Created by Robert Rodriguez on 02/05/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DEViewController : UIViewController
- (IBAction)Back:(id)sender;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBar;
@property (strong, nonatomic) IBOutlet UITableView *myTable;

@property (strong,nonatomic) NSMutableArray *dietastoti;

@end
