//
//  ViewController.m
//  IBActionAppGrupo10
//
//  Created by IOS on 24/02/14.
//  Copyright (c) 2014 Area 51. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    numero1 = 2;
    self.texto2.text = @"Gollum";
}


-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    
}

- (IBAction)textoCambio:(UITextField *)sender {
    
    
    
}





- (IBAction)seApretoClonar:(id)sender {

    self.texto2.text = self.texto1.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
