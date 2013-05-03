//
//  LagViewController.m
//  Nutricion
//
//  Created by Robert Rodriguez on 02/05/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "LagViewController.h"

@interface LagViewController ()

@end

@implementation LagViewController
int counter=1;
@synthesize lag;

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

- (IBAction)tap:(id)sender {
    counter++;
    NSString *lagString = [NSString stringWithFormat:@"%i",counter-1];
    lag.text = lagString;
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    self.view.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    if (counter==21) {
           UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"LLegaste"
                                                            message:@"Haz terminado"
                                                             delegate:nil
                                                    cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:nil];
        
        [message show];
        UIViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"Info"];
        counter=1;
        [self presentViewController:loginView animated:YES completion:nil];
    }
}
@end
