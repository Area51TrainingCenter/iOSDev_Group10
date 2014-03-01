//
//  MiTabBarController.m
//  MiTablaAppGrupo10
//
//  Created by Diego Cruz on 28/02/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "MiTabBarController.h"

@interface MiTabBarController ()

@end

@implementation MiTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.misFavoritos = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
