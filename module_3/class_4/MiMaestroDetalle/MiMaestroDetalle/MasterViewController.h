//
//  MasterViewController.h
//  MiMaestroDetalle
//
//  Created by Diego Cruz on 7/04/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
