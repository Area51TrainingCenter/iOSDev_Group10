//
//  DetalleCancionTableViewController.m
//  MisObjetosApp
//
//  Created by Diego Cruz on 7/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "DetalleCancionTableViewController.h"

@interface DetalleCancionTableViewController ()

@end

@implementation DetalleCancionTableViewController

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

-(void)viewWillAppear:(BOOL)animated
{
    self.tituloLabel.text = self.miCancion.titulo;
    self.artistaLabel.text = self.miCancion.nombreArtista;
    self.albumCoverview.image = self.miCancion.albumCover;
    
    self.title = self.miCancion.titulo;
    self.duracionLabel.text = [self.miCancion obtenerDuracionFormateada];
    self.generoLabel.text = self.miCancion.nombreGenero;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
