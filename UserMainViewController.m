//
//  UserMainViewController.m
//  Nutricion
//
//  Created by Lion User on 24/04/2013.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "UserMainViewController.h"
#import "ViewController.h"

@interface UserMainViewController ()

@end

@implementation UserMainViewController
@synthesize welcomeUser;
NSString *name;


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
        
    //[self.view addSubview:userLoginView];
    name=[[NSUserDefaults standardUserDefaults]objectForKey:@"name"];
    welcomeUser.text=(@"Welcome %@",name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutButton:(id)sender {
ToSave:
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginStatus"];
    
    ViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
    //perform transition
    [self presentViewController:loginView animated:YES completion:nil];}
@end
