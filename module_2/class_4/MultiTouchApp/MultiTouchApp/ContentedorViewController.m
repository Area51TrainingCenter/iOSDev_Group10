//
//  ContentedorViewController.m
//  MultiTouchApp
//
//  Created by iOS on 3/19/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "ContentedorViewController.h"

@interface ContentedorViewController ()

@end

@implementation ContentedorViewController

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
}


- (IBAction)seEstaHaciendoPanAlCenterView:(UIPanGestureRecognizer *)sender {
    
    CALayer *centerLayer = sender.view.layer;
    CGPoint translacion = [sender translationInView:self.view];
    
    CGPoint nuevoPoint = centerLayer.position;
    
    //
    nuevoPoint.x += translacion.x;
    //
    
    int superX =self.view.layer.position.x;
    
    if (nuevoPoint.x >= superX) {
        self.leftMenuView.alpha = 1;
        self.rightMenuView.alpha = 0;
        
        int topeDerecha = superX+self.leftMenuView.frame.size.width;
        
        if (nuevoPoint.x > topeDerecha) {
            nuevoPoint.x = topeDerecha;
        }
        
    }
    else
    {
        self.leftMenuView.alpha = 0;
        self.rightMenuView.alpha = 1;
        
        int topeIzquierda = superX-self.leftMenuView.frame.size.width;
        
        if (nuevoPoint.x < topeIzquierda) {
            nuevoPoint.x = topeIzquierda;
        }
    }
    
    
    
    centerLayer.position = nuevoPoint;
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
