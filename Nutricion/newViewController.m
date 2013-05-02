//
//  newViewController.m
//  Nutricion
//
//  Created by Robert Rodriguez on 12/04/13.
//  Copyright (c) 2013 Robert Rodriguez. All rights reserved.
//

#import "newViewController.h"
#import "ViewController.h"
#import "UserMainViewController.h"

@interface newViewController ()

@end

@implementation newViewController

@synthesize name,lastname,password,username,age,weight,height,scrollView,campoActivo;
NSMutableData *webData;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view.
    webData = [NSMutableData new];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(apareceElTeclado:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(desapareceElTeclado:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    //La propiedad 'scrollView' es un outlet al UIScrollView del NIB
    [[self scrollView] setContentSize:[[self view] frame].size];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPulsado)];
    [tapRecognizer setCancelsTouchesInView:NO];
    [[self scrollView] addGestureRecognizer:tapRecognizer];
    
    
    //LLENANDO DATOS
    if(didLoginFB==true){
        name.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"firstnameFB"];
        lastname.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"lastnameFB"];
        //name.text=@"si";
    }
    }

- (void) scrollViewPulsado
{
    [[self view] endEditing:YES];
}

- (void) desapareceElTeclado:(NSNotification *)laNotificacion
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UIEdgeInsets edgeInsets = UIEdgeInsetsZero;
    [[self scrollView] setContentInset:edgeInsets];
    [[self scrollView] setScrollIndicatorInsets:edgeInsets];
    [UIView commitAnimations];
}

- (void) apareceElTeclado:(NSNotification *)laNotificacion
{
    //Obtenemos el tamaño del teclado
    NSDictionary *infoNotificacion = [laNotificacion userInfo];
    CGSize tamanioTeclado = [[infoNotificacion objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Modificamos el tamaño de la 'ventana' de nuestro scroll view
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, tamanioTeclado.height, 0);
    [[self scrollView] setContentInset:edgeInsets];
    [[self scrollView] setScrollIndicatorInsets:edgeInsets];
    
    [[self scrollView] scrollRectToVisible:[self campoActivo].frame animated:YES];
}

#pragma mark - Métodos de UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self setCampoActivo:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self setCampoActivo:nil];
}



- (IBAction)back:(id)sender {
    backButtonPressed=true;
    //Instantiate blue controller
    ViewController *loginView = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
    //perform transition
    [self presentViewController:loginView animated:YES completion:nil];
}

- (IBAction)done:(id)sender {
   
    NSString *url = @"http://166.78.30.215/nutricion2/users/add.json";
    //NSString *url = @"http://166.78.30.215/app/users/add.json";
    
    
    NSMutableDictionary *user = [NSMutableDictionary new];
    NSMutableDictionary *userParameters = [NSMutableDictionary new];
    
    if(![name.text isEqualToString:@""] || ![lastname.text isEqualToString:@""]|| ![username.text isEqualToString:@""]|| ![lastname.text isEqualToString:@""]){
        //Setting the parameters of the user
        [userParameters setObject:name.text                 forKey:@"name"];
        [userParameters setObject:lastname.text             forKey:@"lastname"];
        [userParameters setObject:username.text             forKey:@"username"];
        [userParameters setObject:password.text             forKey:@"password"];
         [userParameters setObject:weight.text               forKey:@"weight"];
        [userParameters setObject:height.text               forKey:@"height"];
        [userParameters setObject:name.text               forKey:@"profile_pic"];
        [userParameters setObject:name.text               forKey:@"role"];
        [userParameters setObject:age.text                  forKey:@"age"];
        [userParameters setObject:name.text               forKey:@"routine"];
        
    }
    
    [user setObject:userParameters forKey:@"User"];
    
    //Making NSData from NSMutableDictionary
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:user
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    
    //Changing from NSData to NSString;
    NSString *stringToSend = [[NSString alloc] initWithData:data
                                                   encoding:NSUTF8StringEncoding];
    
    //Creating the NSMutableRequest
    NSString *params = [[NSString alloc] initWithFormat:@"data=%@",stringToSend];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    //Creating the NSURLConnection
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                  delegate:self];
    
    if(!connection){
        NSLog(@"Hubo un error");
    }

    
}

#pragma mark - HTTP Request

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)users{
    [webData setLength:0];
    NSLog(@"didReceiveResponse");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [webData appendData:data];
    //NSLog(@"%@",data);
    NSLog(@"didReceiveData");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSError *error;
    NSDictionary *users = [NSJSONSerialization JSONObjectWithData:webData
                                                             options:kNilOptions
                                                               error:&error];
    NSLog(@"Response: %@", users);
    if([[users valueForKey:@"status"] isEqualToString:@"success"]){
        //UserMainViewController *userMain = [self.storyboard instantiateViewControllerWithIdentifier:@"userMain"];
        //perform transition
        //[self presentViewController:userMain animated:YES completion:nil];
         notRegistered=false;
        
        UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
        [self presentViewController:tabBarController animated:YES completion:nil];
        
    ToSave:
        [[NSUserDefaults standardUserDefaults] setObject:@"alreadyLogin" forKey:@"loginStatus"];
        [[NSUserDefaults standardUserDefaults] setObject:@"didRegister" forKey:@"firstRegister"];
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.password resignFirstResponder];
        [self.username resignFirstResponder];
        [self.lastname resignFirstResponder];
        [self.weight resignFirstResponder];
        [self.height resignFirstResponder];
        [self.age resignFirstResponder];
        [self.name resignFirstResponder];
    }
}

 
@end