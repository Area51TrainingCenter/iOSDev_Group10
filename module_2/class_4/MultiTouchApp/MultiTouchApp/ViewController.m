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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark Se hicieron Tab
- (IBAction)seHizoTab:(UITapGestureRecognizer *)sender {
    
    //self.view.backgroundColor =
    sender.view.backgroundColor =
    [UIColor greenColor];
}
- (IBAction)seHizoDobleTap:(UITapGestureRecognizer *)sender {
    self.view.backgroundColor =
    //sender.view.backgroundColor =
    [UIColor whiteColor];
}

#pragma mark Se Esta Haciendo Pan
- (IBAction)PanReco:(UIPanGestureRecognizer *)sender {
    UIView *soyView = sender.view;
    
    if (sender.state != UIGestureRecognizerStateEnded)
    
        /*
    //Metodo 1 Se aplica menos en el estado Ended
    //Desventa: Estamos chancando defrente sin importar el View
    //inView es el X Y de donde se encuentra tu dedo en ese momento
    {
    soyView.layer.position = [sender locationOfTouch:0 inView:self.view];
    }
    */
    
    //Metodo 2
    //translationInView te dice cuanto a cambiado de lugar (el moviemiento - trayectoria)
        
    {
        
    CGPoint translation = [sender translationInView:self.view];
    
    CGPoint nuevaPosicion = soyView.layer.position;
        
        nuevaPosicion.x += translation.x;
        //esto es como hacer =>nuevaPosicion.x = nuevaPosicion.x + translation.x
        nuevaPosicion.y += translation.y;
        
        //soyView.layer.position = nuevaPosicion;
        //hasta aca se te van a sumar las posiciones y se te va a disparar el view entonces
        //[sender setTranslation:CGPointZero inView:self.view];
        //CGPointZero = (0,0)
        
    if ((nuevaPosicion.x - (soyView.frame.size.width/2) >= 0 && nuevaPosicion.x + (soyView.frame.size.width/2) <= self.view.frame.size.width) && (nuevaPosicion.y - (soyView.frame.size.height/2) >= 0 && nuevaPosicion.y + (soyView.frame.size.height/2) <= self.view.frame.size.height))
        
    {
        soyView.layer.position = nuevaPosicion;
        //soyView.layer.transform = CATransform3DTranslate(soyView.layer.transform, translation.x, translation.y, 0);
    }
        [sender setTranslation:CGPointZero inView:self.view];
    }
    
    
}
- (IBAction)seEstaHaciendoPinch:(UIPinchGestureRecognizer *)sender {
    
    //sender.scale
    
    //le aplico el sacale a las dimensiones del view
    CALayer *miLayer = sender.view.layer;
    miLayer.transform = CATransform3DScale(miLayer.transform, sender.scale, sender.scale, 1);
    
    sender.scale = 1;

}

- (IBAction)seEstaHaciendoRotate:(UIRotationGestureRecognizer *)sender {
    
    CALayer *miLayer = sender.view.layer;
    miLayer.transform = CATransform3DRotate(miLayer.transform, sender.rotation*3, 0, 0, 1);
    
    sender.rotation = 0;
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
