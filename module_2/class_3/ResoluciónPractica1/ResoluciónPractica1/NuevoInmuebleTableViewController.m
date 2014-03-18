//
//  NuevoInmuebleTableViewController.m
//  ResoluciónPractica1
//
//  Created by Diego Cruz on 17/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "NuevoInmuebleTableViewController.h"
#import "Inmueble.h"

@interface NuevoInmuebleTableViewController ()

@end

@implementation NuevoInmuebleTableViewController

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
    
    tipos = @[@"Venta",@"Alquiler"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Creacion de PickerView

-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return tipos.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return tipos[row];
}

#pragma mark Eventos de PickerView

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.tipoLabel.text = tipos[row];
}

#pragma mark CREAR/CANCELAR
- (IBAction)seApretoCrear:(UIBarButtonItem *)sender {
    
    Inmueble *nuevoInmueble = [[Inmueble alloc] init];
    nuevoInmueble.nombre = self.nombreTextfield.text;
    nuevoInmueble.tipo = [self.tiposPickerView selectedRowInComponent:0];
    
    //Lo meto al arreglo de Inmuebles
    if (nuevoInmueble.tipo == 0) {
        [self.inmueblesVenta insertObject:nuevoInmueble atIndex:0];
    }
    else
    {
        [self.inmueblesAlquiler insertObject:nuevoInmueble atIndex:0];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
