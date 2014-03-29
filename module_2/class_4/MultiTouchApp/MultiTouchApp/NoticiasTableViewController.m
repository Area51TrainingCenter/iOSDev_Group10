//
//  NoticiasTableViewController.m
//  MultiTouchApp
//
//  Created by Diego Cruz on 28/03/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "NoticiasTableViewController.h"

@interface NoticiasTableViewController ()

@end

@implementation NoticiasTableViewController

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

- (IBAction)menuDerechaPressed:(UIBarButtonItem *)sender {
    
    [self.miDelegado seApretoMenuDerecha];
    
}

- (IBAction)menuIzquierdaPressed:(UIBarButtonItem *)sender {
    
    [self.miDelegado seApretoMenuIzquierda];
}

@end
