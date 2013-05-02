//
//  ForgotPassViewController.h
//  Nutricion
//
//  Created by Lion User on 29/04/2013.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ForgotPassViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)sendMailPressed:(id)sender;
- (IBAction)registerButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *mailToSend;
@end
