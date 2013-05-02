//
//  ViewController.h
//  Nutricion
//
//  Created by Robert Rodriguez on 12/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <FacebookSDK/FacebookSDK.h>


@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) NSMutableArray *myUsers;
@property (strong, nonatomic) NSMutableArray *correos;
@property (strong, nonatomic) IBOutlet UISwitch *rememberMeOutlet;
//@property (strong,nonatomic) FBLoginView *userLoginView;
//@property (strong,nonatomic) NSString *remember;

- (IBAction)login:(id)sender;
- (IBAction)reg:(id)sender;
- (IBAction)forgot:(id)sender;
- (IBAction)rememberMe:(id)sender;
- (IBAction)totti:(id)sender;

- (IBAction)send:(id)sender;
- (IBAction)reg1:(id)sender;
- (IBAction)backf:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *mail;
@property (strong, nonatomic) IBOutlet UIButton *fbb;
@end
BOOL remember;
FBLoginView *userLoginView;
