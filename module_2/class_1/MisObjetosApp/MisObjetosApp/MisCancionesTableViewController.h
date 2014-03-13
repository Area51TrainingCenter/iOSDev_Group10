//
//  MisCancionesTableViewController.h
//  MisObjetosApp
//
//  Created by Diego Cruz on 5/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NuevaCancionTableViewController.h"

@interface MisCancionesTableViewController : UITableViewController <NuevaCancionDelegate>
{
    NSMutableArray *canciones;
    int anteriorCount;
}
@end
