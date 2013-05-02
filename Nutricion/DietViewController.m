//
//  DietViewController.m
//  Nutricion
//
//  Created by Robert Rodriguez on 01/05/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "DietViewController.h"
#import "PMCalendar.h"
#import "tabViewController.h"
#import "MyCell.h"

@interface DietViewController ()

@property (nonatomic, strong) PMCalendarController *pmCC;

@end

@implementation DietViewController
@synthesize pmCC,myTable,Navbar;
@synthesize diet,period1,horas;
int flag=0;
NSString *aux,*aux1;

NSString *hora1 = @"08:00";
NSString *hora2 = @"12:00";
NSString *hora3 = @"14:00";
NSString *hora4 = @"17:00";
NSString *hora5 = @"20:00";

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
    
    horas = [NSMutableArray new];
    [horas addObject:hora1];
    [horas addObject:hora2];
    [horas addObject:hora3];
    [horas addObject:hora4];
    [horas addObject:hora5];
    //Navbar.topItem.title = @"hola";
    
     NSLog(@"hola %i",flag);
	// Do any additional setup after loading the view.

        period1=[PMPeriod oneDayPeriodWithDate:[NSDate date]];
    
    if(flag==0){
        BOOL isPopover = YES;
        //   isPopover = NO;
        self.pmCC = [[PMCalendarController alloc] initWithThemeName:@"apple calendar"];
        
        [self.pmCC presentCalendarFromRect:CGRectZero
                                    inView:self.view
                  permittedArrowDirections:PMCalendarArrowDirectionAny
                                 isPopover:isPopover
                                  animated:YES];
        self.pmCC.delegate = self;
        self.pmCC.mondayFirstDayOfWeek = NO;
        self.pmCC.period = period1;
        //[self calendarController:pmCC didChangePeriod:pmCC.period];
        
    }
    else if (flag==1){
        Navbar.topItem.title =aux1;
            diet.text= aux;

    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)calendarController:(PMCalendarController *)calendarController didChangePeriod:(PMPeriod *)newPeriod
{
    int currentnavstate = [[NSUserDefaults standardUserDefaults]integerForKey:@"selectedbar"];
        
    aux = [newPeriod.startDate dateStringWithFormat:@"dd-MM-yyyy"];
        
            UIViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"diet"];
            
    if (currentnavstate==2) {
        aux1 = @"Diet";
        
    }
    else if (currentnavstate==1){
         aux1 = @"Exercise";
        
    }
    flag=1;
    [self presentViewController:loginView animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Back1:(id)sender {
    flag=0;
    UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
    
    if ([Navbar.topItem.title isEqualToString:@"Diet"]) {
        tabBarController.selectedIndex =2;
        
    }
    else if ([Navbar.topItem.title isEqualToString:@"Exercise"]){
        tabBarController.selectedIndex =1;
        
    }
    
    
    
    [self presentViewController:tabBarController animated:YES completion:nil];
    
    
}



//table views codigo

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    cell.hour.text = [horas objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{

    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:@"password1"];
    //NSLog(@"entroooooooooooooo%i",indexPath.row);
    UIViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"Info"];
    [self presentViewController:loginView animated:YES completion:nil];
    
    
}


@end
