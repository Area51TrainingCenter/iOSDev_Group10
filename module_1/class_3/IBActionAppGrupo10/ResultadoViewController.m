//
//  ResultadoViewController.m
//  IBActionAppGrupo10
//
//  Created by Diego Cruz on 26/02/14.
//  Copyright (c) 2014 Area 51. All rights reserved.
//

#import "ResultadoViewController.h"

@interface ResultadoViewController ()

@end

@implementation ResultadoViewController

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
    //NO ACAAAAAAAAAA
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.resultadoLabel.text = self.resultadoString;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
