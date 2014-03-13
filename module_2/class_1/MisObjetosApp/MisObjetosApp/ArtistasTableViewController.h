//
//  ArtistasTableViewController.h
//  MisObjetosApp
//
//  Created by Diego Cruz on 12/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cancion.h"

@interface ArtistasTableViewController : UITableViewController
{
    NSArray *artistas;
    
}

@property (strong,nonatomic) Cancion *miCancion;

@end
