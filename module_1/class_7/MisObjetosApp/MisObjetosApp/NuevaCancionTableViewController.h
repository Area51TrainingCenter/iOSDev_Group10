//
//  NuevaCancionTableViewController.h
//  MisObjetosApp
//
//  Created by Diego Cruz on 7/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cancion.h"

@protocol NuevaCancionDelegate <NSObject>

-(void)NuevaCancionSeGuardo:(Cancion *)nuevaCancion;

@end

@interface NuevaCancionTableViewController : UITableViewController


@property (strong,nonatomic) id<NuevaCancionDelegate> miDelegado;

@end
