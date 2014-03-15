//
//  DialogTableViewController.m
//  DialogApp
//
//  Created by Diego Cruz on 14/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "DialogTableViewController.h"

@interface DialogTableViewController ()

@end

@implementation DialogTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) //ALERTA
    {
        UIAlertView *miAlerta = [[UIAlertView alloc] initWithTitle:@"¡Cuidado!" message:@"El mundo se está acabando, ¿Quiere arrepentirse?." delegate:self cancelButtonTitle:@"Me Arrepiento" otherButtonTitles:@"No",nil];
        
        [miAlerta show];
    }
    else if (indexPath.row == 1) { //ACTION SHEET
        
        /*
        UIActionSheet *miActionSheet = [[UIActionSheet alloc] initWithTitle:@"¿Qué desea hacer?" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Copiar",@"Compartir Ubicación",@"Agregar Foto", nil];
        */
        
        UIActionSheet *miActionSheet = [[UIActionSheet alloc] initWithTitle:@"¿Estás seguro de eliminar este amigo?" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Eliminar amigo" otherButtonTitles:@"Mover a Baúl",nil];
         
        [miActionSheet showInView:self.view];
    }
    else if (indexPath.row == 2) {
        
        UIActivityViewController *miActivity = [[UIActivityViewController alloc] initWithActivityItems:@[@"Escuchando U2 - Elevation",[UIImage imageNamed:@"imagen"]] applicationActivities:nil];
        miActivity.excludedActivityTypes = @[UIActivityTypePrint];
        
        [self presentViewController:miActivity animated:YES completion:nil];
    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
    }
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.cancelButtonIndex == buttonIndex) {
        
        
    }
    
}

@end
