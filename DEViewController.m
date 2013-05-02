//
//  DEViewController.m
//  Nutricion
//
//  Created by Robert Rodriguez on 02/05/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "DEViewController.h"
#import "MyCell1.h"

@interface DEViewController ()

@end

@implementation DEViewController
@synthesize myTable,navBar;
NSString *hora11 = @"08:00";
NSString *hora12 = @"12:00";
NSString *hora13 = @"14:00";
NSString *hora14 = @"17:00";
NSString *hora15 = @"20:00";

NSString *dieta11 = @"4 claras con jamón de pavo";
NSString *dieta12 = @"Fruta";
NSString *dieta13 = @"-300 g de carne\n-Pasta\n-2 tortillas";
NSString *dieta14 = @"Fruta";
NSString *dieta15 = @"-200 g de pescado\n-Pan";


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
//    if () {
//        <#statements#>
//    }
    
    int i =[[NSUserDefaults standardUserDefaults]integerForKey:@"password1"];
    switch (i) {
        case 0:
            navBar.title = hora11;
            break;
        case 1:
            navBar.title = hora12;
            break;
        case 2:
            navBar.title = hora13;
            break;
        case 3:
            navBar.title = hora14;
            break;
        case 4:
            navBar.title = hora15;
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell1"];
    
    switch (indexPath.row) {
        case 0:
            cell.myLabel.text = dieta11;
            break;
        case 1:
            cell.myLabel.text = dieta12;
            break;
        case 2:
            cell.myLabel.text = dieta13;
            break;
        case 3:
            cell.myLabel.text = dieta14;
            break;
        case 4:
            cell.myLabel.text = dieta15;
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (IBAction)Back:(id)sender {
}
@end
