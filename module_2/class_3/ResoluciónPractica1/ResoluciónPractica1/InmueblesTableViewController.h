//
//  InmueblesTableViewController.h
//  ResoluciónPractica1
//
//  Created by Diego Cruz on 17/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Inmueble.h"

@interface InmueblesTableViewController : UITableViewController
{
    NSMutableArray *inmueblesVenta;
    NSMutableArray *inmueblesAlquiler;
    
    NSArray *inmueblesActual;
    int anteriorCount;
}

@end
