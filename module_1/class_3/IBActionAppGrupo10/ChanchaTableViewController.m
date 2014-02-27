//
//  ChanchaTableViewController.m
//  IBActionAppGrupo10
//
//  Created by IOS on 24/02/14.
//  Copyright (c) 2014 Area 51. All rights reserved.
//

#import "ChanchoTableViewController.h"
#import "ResultadoViewController.h"

@interface ChanchoTableViewController ()

@end

@implementation ChanchoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.montoCuentaTextField.keyboardType = UIKeyboardTypeNumberPad;
}

- (IBAction)numPersonasCambio:(UIStepper *)sender {
    int valorEntero  = sender.value;
    //
    NSString *valorString;
    //Manera 1
    valorString = [NSString stringWithFormat:@"%0.0f",sender.value];
    
    /*
    //Manera 2
    NSNumber *valorNumber = [NSNumber numberWithDouble:sender.value];
    valorString = [valorNumber stringValue];
    */
    
    self.personaslLabel.text = valorString;
    
    
    if (valorEntero > 0) {
        [self calcularChancha];
    }
    
}


- (IBAction)textFieldCambio:(UITextField *)sender {

    if (self.montoCuentaTextField.text.intValue > 0) {
        [self calcularChancha];
    }
    
}



- (void)calcularChancha
{
    
    float resultado;
    float monto = self.montoCuentaTextField.text.floatValue;
    int numPersonas = self.personasStepper.value;
    float propina = self.propinaTextField.text.floatValue;
    
    resultado = (monto+propina)/numPersonas;
    
    NSNumber *resultadoNumber = [NSNumber numberWithFloat:resultado];
    self.resultadoLabel.text = resultadoNumber.stringValue;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if ([textField isEqual:self.montoCuentaTextField]) {
        [self.propinaTextField becomeFirstResponder];
    }
    
    return YES; //YES == TRUE == true== 1
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    //Oportunidad para detener el segue
    
    return YES;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // resultado -> resultado
    // 1. resultado, check
    // 2. la escena destino
    // 3. Label de la escena destino
    
    ResultadoViewController *destino = segue.destinationViewController;
    destino.resultadoString = self.resultadoLabel.text;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
