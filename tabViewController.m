//
//  tabViewController.m
//  Nutricion
//
//  Created by Robert Rodriguez on 01/05/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "tabViewController.h"
#import "DietViewController.h"

@interface tabViewController ()

@end

@implementation tabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//rover gay 1803864
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.delegate=self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
{
    [[NSUserDefaults standardUserDefaults] setInteger:tabBarController.selectedIndex forKey:@"selectedbar"];
    //NSLog(@"entro");
    
}
@end
