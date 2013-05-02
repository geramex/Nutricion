//
//  UserMainViewController.h
//  Nutricion
//
//  Created by Lion User on 24/04/2013.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserMainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *welcomeUser;
- (IBAction)logoutButton:(id)sender;

@end
