//
//  newViewController.h
//  Nutricion
//
//  Created by Robert Rodriguez on 12/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newViewController : UIViewController <NSURLConnectionDelegate>
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *lastname;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *weight;
@property (strong, nonatomic) IBOutlet UITextField *height;
@property (strong, nonatomic) IBOutlet UITextField *age;
@property (strong, nonatomic) IBOutlet UITextField *campoActivo;

- (IBAction)back:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *backButtonOutlet;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)done:(id)sender;
@end
BOOL notRegistered;
BOOL backButtonPressed;
BOOL didLoginFB;

