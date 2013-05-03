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
@synthesize myTable,navBar,dietastoti;
NSString *hora11 = @"08:00";
NSString *hora12 = @"12:00";
NSString *hora13 = @"14:00";
NSString *hora14 = @"17:00";
NSString *hora15 = @"20:00";

int bflag=0;
int indexf=0;

NSString *dieta11 = @"-4 claras con jamón de pavo";
NSString *dieta12 = @"-Fruta";
NSString *dieta13 = @"-300 g de carne\n-Pasta\n-2 tortillas";
NSString *dieta14 = @"-Fruta";
NSString *dieta15 = @"-200 g de pescado\n-Pan";

NSString *exc11 = @"Correr 15 min";
NSString *exc12 = @"Curl Bicep manc 3x12";
NSString *exc13 = @"Curl Bicep barra z 3x12";
NSString *exc14 = @"20 lagartijas";
NSString *exc15 = @"Copa tricep 4x12";


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
    dietastoti = [NSMutableArray new];
    [dietastoti addObject:dieta11];
    [dietastoti addObject:dieta12];
    [dietastoti addObject:dieta13];
    [dietastoti addObject:dieta14];
    [dietastoti addObject:dieta15];
    
    int sb =[[NSUserDefaults standardUserDefaults]integerForKey:@"selectedbar"];
	// Do any additional setup after loading the view.
    if (sb==2) {
        int i =[[NSUserDefaults standardUserDefaults]integerForKey:@"password1"];
        indexf  =i;
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
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        int sb =[[NSUserDefaults standardUserDefaults]integerForKey:@"selectedbar"];
    if (sb==1) {
        return 5;
    }
    else return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell1"];
    UIImage *Image1= [UIImage imageNamed:@"correr.gif"];
    UIImage *Image2= [UIImage imageNamed:@"curl.gif"];
    UIImage *Image3= [UIImage imageNamed:@"curl2.jpg"];
    UIImage *Image4= [UIImage imageNamed:@"lagartija.jpg"];
    UIImage *Image5= [UIImage imageNamed:@"copa.gif"];
    
    int sb =[[NSUserDefaults standardUserDefaults]integerForKey:@"selectedbar"];
    if (sb==1) {
        switch (indexPath.row) {
            case 0:
                cell.myLabel.text = exc11;
                cell.image.image = Image1;
                cell.cts.hidden =NO;
                break;
            case 1:
                cell.myLabel.text = exc12;
                cell.image.image = Image2;
                cell.cts.hidden =YES;
                break;
            case 2:
                cell.myLabel.text = exc13;
                cell.image.image = Image3;
                cell.cts.hidden =YES;
                break;
            case 3:
                cell.myLabel.text = exc14;
                cell.image.image = Image4;
                cell.cts.hidden =NO;
                break;
            case 4:
                cell.myLabel.text = exc15;
                cell.image.image = Image5;
                cell.cts.hidden =YES;
                break;
                
            default:
                break;
        }
    } else{
        cell.cts.hidden =YES;
        cell.myLabel.text = [dietastoti objectAtIndex:indexf];
        
    }

    NSLog(@"entro");
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int sb =[[NSUserDefaults standardUserDefaults]integerForKey:@"selectedbar"];
    if (sb==1) {

    UIViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"s1"];
    UIViewController *loginView1 = [self.storyboard instantiateViewControllerWithIdentifier:@"s2"];
    UIViewController *loginView2 = [self.storyboard instantiateViewControllerWithIdentifier:@"s3"];
    UIViewController *loginView3 = [self.storyboard instantiateViewControllerWithIdentifier:@"s4"];
    UIViewController *loginView4 = [self.storyboard instantiateViewControllerWithIdentifier:@"s5"];
    
    switch (indexPath.row) {
        case 0:
            [self presentViewController:loginView animated:YES completion:nil];
        break;
        case 1:
            [self presentViewController:loginView1 animated:YES completion:nil];
            break;
        case 2:
            [self presentViewController:loginView2 animated:YES completion:nil];
            break;
        case 3:
            [self presentViewController:loginView3 animated:YES completion:nil];
            break;
        case 4:
            [self presentViewController:loginView4 animated:YES completion:nil];
            break;
            
        default:
            break;
    }
        
    }
}

- (IBAction)Back:(id)sender {
    bflag=1;
    [[NSUserDefaults standardUserDefaults] setInteger:bflag forKey:@"bflag"];
    UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
    [self presentViewController:tabBarController animated:YES completion:nil];
    
    
}
@end
