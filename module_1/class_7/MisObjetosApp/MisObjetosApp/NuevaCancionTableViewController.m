//
//  NuevaCancionTableViewController.m
//  MisObjetosApp
//
//  Created by Diego Cruz on 7/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "NuevaCancionTableViewController.h"

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

- (IBAction)seApretoCrear:(UIBarButtonItem *)sender {
    
    //Crear la nueva cancion
    //Cerramos el modal
    //Le avisamos al delegado que se creo nueva canción
    
    [self.miDelegado NuevaCancionSeGuardo:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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


@end
