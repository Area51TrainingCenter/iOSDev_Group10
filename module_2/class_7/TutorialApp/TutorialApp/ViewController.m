//
//  ViewController.m
//  TutorialApp
//
//  Created by Diego Cruz on 26/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    int miX = (self.miSCrollView.frame.size.width - 261)/2;
    int miY = (self.miSCrollView.frame.size.height - 208)/2;
    
    self.miVista.frame = CGRectMake(miX + self.miSCrollView.frame.size.width,miY, 261, 208);
    [self.miSCrollView addSubview:self.miVista];
    
    
    [self.miSCrollView setContentSize:CGSizeMake(self.miSCrollView.frame.size.width*2, self.miSCrollView.frame.size.height)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
