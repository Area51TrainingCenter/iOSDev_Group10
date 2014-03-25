//
//  ViewController.m
//  MultiTouchApp
//
//  Created by iOS on 3/17/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    escalaActual = 1;
    rotationActual = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark Se hicieron Tab
- (IBAction)seHizoTab:(UITapGestureRecognizer *)sender {
    
    //UIView Animations
    [UIView animateWithDuration:2 animations:^{
        sender.view.backgroundColor =
        [UIColor greenColor];
    }];
    
    if (![sender.view isEqual:self.view]) {
        //CoreAnimation
        CALayer *soyLayer = sender.view.layer;
        soyLayer.delegate = self;
        
        [CATransaction setCompletionBlock:^{
            
            CGPoint nuevoPoint = soyLayer.position;
            nuevoPoint.x += 100;
            soyLayer.position = nuevoPoint;
            
        }];
        
        [CATransaction setAnimationDuration:0.5];
        
        CGPoint nuevoPoint = soyLayer.position;
        nuevoPoint.y += 300;
        soyLayer.position = nuevoPoint;
    }
    
    
    
}
- (IBAction)seHizoDobleTap:(UITapGestureRecognizer *)sender {

    [UIView animateWithDuration:2 animations:^{
        sender.view.backgroundColor = [UIColor whiteColor];
    }];
    
}

#pragma mark Se Esta Haciendo Pan
- (IBAction)PanReco:(UIPanGestureRecognizer *)sender {
   
    CALayer *soyLayer = sender.view.layer;
    CGPoint translacion = [sender translationInView:self.view];
    
    CGPoint nuevoPoint = soyLayer.position;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        puntoInicial = nuevoPoint;
    }
    
    [CATransaction setAnimationDuration:0];
    nuevoPoint.x += translacion.x;
    nuevoPoint.y += translacion.y;
    soyLayer.position = nuevoPoint;
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            soyLayer.position = puntoInicial;
            
        }completion:nil];
        
        
    }
    
    /* CON MAKE
    [CATransaction setAnimationDuration:0];
    soyLayer.transform = CATransform3DMakeTranslation(translacion.x, translacion.y, 0);
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        soyLayer.delegate =self;
        [CATransaction setAnimationDuration:0.2];
        soyLayer.transform = CATransform3DMakeTranslation(0, 0, 0);
        
    }
     */
    
}
- (IBAction)seEstaHaciendoPinch:(UIPinchGestureRecognizer *)sender {
    
    CALayer *miLayer = sender.view.layer;
    miLayer.delegate = self;
    
    if (sender.state != UIGestureRecognizerStateEnded) {
        
        [CATransaction setAnimationDuration:0];
        miLayer.transform = CATransform3DScale(miLayer.transform,sender.scale, sender.scale, 1);
        
        escalaActual *= sender.scale;
        
        sender.scale = 1;
    }
    else {
        [CATransaction setAnimationDuration:0.2];
        miLayer.transform = CATransform3DScale(miLayer.transform,1/escalaActual,1/escalaActual, 1);
        escalaActual = 1;
    }
    
}

- (IBAction)seEstaHaciendoRotate:(UIRotationGestureRecognizer *)sender {
    
    CALayer *miLayer = sender.view.layer;
    miLayer.delegate = self;
    
    [CATransaction setAnimationDuration:0];
    miLayer.transform = CATransform3DRotate(miLayer.transform,sender.rotation, 0, 0, 1);
    rotationActual += sender.rotation;
    sender.rotation = 0;
    
    if (UIGestureRecognizerStateEnded == sender.state) {
        /*
        [CATransaction setAnimationDuration:0.2];
        miLayer.transform = CATransform3DRotate(miLayer.transform,-rotationActual, 0, 0, 1);
        
        rotationActual = 0;
         */
    }
    
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (IBAction)seEstaHaciendoLongPress:(UILongPressGestureRecognizer *)sender {
    
    
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        UIActionSheet *miActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Eliminar Rectangulo" otherButtonTitles:nil];
        
        [miActionSheet showInView:self.view];
        
    }
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        
        UIView *miView;
        [miView removeFromSuperview];
        
    }
}

@end
