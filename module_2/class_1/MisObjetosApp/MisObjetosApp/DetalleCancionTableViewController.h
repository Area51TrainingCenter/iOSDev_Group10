//
//  DetalleCancionTableViewController.h
//  MisObjetosApp
//
//  Created by Diego Cruz on 7/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cancion.h"

@interface DetalleCancionTableViewController : UITableViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *albumCoverview;
@property (strong, nonatomic) IBOutlet UILabel *tituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistaLabel;
@property (strong, nonatomic) IBOutlet UILabel *duracionLabel;
@property (weak, nonatomic) IBOutlet UILabel *generoLabel;

@property (strong,nonatomic) Cancion *miCancion;

@end
