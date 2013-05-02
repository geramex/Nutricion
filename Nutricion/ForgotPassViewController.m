//
//  ForgotPassViewController.m
//  Nutricion
//
//  Created by Lion User on 29/04/2013.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "ForgotPassViewController.h"
#import "newViewController.h"
#import "ViewController.h"

@interface ForgotPassViewController ()

@end

@implementation ForgotPassViewController
@synthesize mailToSend;


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMailPressed:(id)sender {
   NSMutableArray *correos = [NSMutableArray new];
    [correos addObject:mailToSend.text];
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
	mailController.mailComposeDelegate = self;
    NSString *tipo =@"hola";
	[mailController setSubject: @"Referente al pedido"];
    [mailController setMessageBody: tipo isHTML:NO];
    [mailController setToRecipients:correos];
    [self presentModalViewController:mailController animated:YES];

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    int lol;
    //    message.hidden = NO;
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            lol = 1;
            //            message.text = @"Result: canceled";
            break;
        case MFMailComposeResultSaved:
            lol = 2;
            //            message.text = @"Result: saved";
            break;
        case MFMailComposeResultSent:
            lol = 3;
            //            message.text = @"Result: sent";
            break;
        case MFMailComposeResultFailed:
            lol = 4;
            //            message.text = @"Result: failed";
            break;
        default:
            lol = 5;
            //            message.text = @"Result: not sente";
            break;
    }
    
    NSLog(@"%d", lol);
    
    [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)registerButtonPressed:(id)sender {
    //Instantiate blue controller
    newViewController *blue = [self.storyboard instantiateViewControllerWithIdentifier:@"newController"];
    //perform transition
    [self presentViewController:blue animated:YES completion:nil];
}

- (IBAction)backButtonPressed:(id)sender {
    //Instantiate blue controller
    ViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
    //perform transition
    [self presentViewController:loginView animated:YES completion:nil];
}
@end
