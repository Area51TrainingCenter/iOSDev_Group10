//
//  NuevaCancionTableViewController.m
//  MisObjetosApp
//
//  Created by Diego Cruz on 7/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "NuevaCancionTableViewController.h"
#import "ArtistasTableViewController.h"

@interface NuevaCancionTableViewController ()

@end

@implementation NuevaCancionTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)seApretoCancelar:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)sliderCambioValor:(UISlider *)sender {
    
    nuevaCancion.duracion = @(sender.value);
    self.duracionLabel.text =[nuevaCancion obtenerDuracionFormateada];

}




- (IBAction)seApretoCrear:(UIBarButtonItem *)sender {
    
    //Crear la nueva cancion
    //Cerramos el modal
    //Le avisamos al delegado que se creo nueva canción
    
    nuevaCancion.titulo = self.tituloTextField.text;
    
    //añadiendo la nueva canción en canciones
    [self.canciones insertObject:nuevaCancion atIndex:0];
    
    
    //[self.miDelegado NuevaCancionSeGuardo:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    nuevaCancion = [[Cancion alloc] init];
    generos = @[@"-Selecciona un género-",@"Clásico", @"Reggeaton", @"Rock",@"Balada", @"Grunge", @"Hip hop",@"Electrónica"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (nuevaCancion.nombreArtista) {
        
        if (![nuevaCancion.nombreArtista isEqualToString:@""]) {
            self.artistaLabel.text = nuevaCancion.nombreArtista;
            self.artistaLabel.textColor = [UIColor blackColor];
        }
        else
        {
            self.artistaLabel.text = @"Selecciona un artista";
            self.artistaLabel.textColor = [UIColor lightGrayColor];
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ArtistasTableViewController *destino = segue.destinationViewController;
    destino.miCancion = nuevaCancion;
}


-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row <3) {
            return 44;
        }
        else
        {
            return 146*generoSeleccionado;
        }
    }
    else
    {
        return 77;
    }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 2) {
        
        if (generoSeleccionado) {
            generoSeleccionado = NO;
        }
        else
        {
            generoSeleccionado = YES;
        }
        
        NSIndexPath *miIndex = [NSIndexPath indexPathForRow:3 inSection:0];
        [tableView reloadRowsAtIndexPaths:@[miIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView reloadData];
    }
}



-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return generos.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return generos[row];
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //1.
    NSString *generoSeleccionado = generos[row];
    //2.
    self.generoLabel.text = generoSeleccionado;
    
    if (row==0) {
        nuevaCancion.nombreGenero = nil;
        self.generoLabel.textColor = [UIColor lightGrayColor];
    }
    else
    {
        nuevaCancion.nombreGenero = generoSeleccionado;
        self.generoLabel.textColor = [UIColor blackColor];
    }
}

@end
