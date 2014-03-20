//
//  ViewController.m
//  MultitouchApp
//
//  Created by Diego Cruz on 17/03/14.
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)seEstaHaciendoPan:(UIPanGestureRecognizer *)sender {
    UIView *soyView = sender.view;
    
    /*
    if (sender.state != UIGestureRecognizerStateEnded) {
        //Metodo 1
        soyView.layer.position = [sender locationOfTouch:0 inView:self.view];
    }
    */
    
    
    //Metodo 2
    CGPoint translacion = [sender translationInView:self.view];
    CGPoint nuevaPosicion = soyView.layer.position;
    
    nuevaPosicion.x += translacion.x;
    // nuevaPosicion.x= nuevaPosicion.x + translacion.x;
    nuevaPosicion.y += translacion.y;
    
    if ( (nuevaPosicion.x - (soyView.frame.size.width/2) >=0 && nuevaPosicion.x + (soyView.frame.size.width/2) <= self.view.frame.size.width) && (nuevaPosicion.y - (soyView.frame.size.height/2) >=0 && nuevaPosicion.y + (soyView.frame.size.height/2) <= self.view.frame.size.height) )
    {
        soyView.layer.position = nuevaPosicion;
    }
    
    
    [sender setTranslation:CGPointZero inView:self.view];
    //CGPointZero = (0,0)

    
}

- (IBAction)seHizoTap:(UITapGestureRecognizer *)sender {
    
    sender.view.backgroundColor = [UIColor orangeColor];
}

- (IBAction)seHizoDobleTap:(UITapGestureRecognizer *)sender {
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (IBAction)seEstaHaciendoPinch:(UIPinchGestureRecognizer *)sender {
    
    CALayer *miLayer = sender.view.layer;
    
    //Le aplico el scale a las dimensiones del view
    // El width y el height tienen que ser afectados por el scale
    
    miLayer.transform = CATransform3DMakeScale(sender.scale, sender.scale, 1);
    
    
}





@end
