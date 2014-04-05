//
//  Practica2TableViewController.m
//  SolucionPractica2
//
//  Created by Diego Cruz on 4/04/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "Practica2TableViewController.h"

@interface Practica2TableViewController ()

@end

@implementation Practica2TableViewController

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
    
    misBotoncitos = @[self.botoncito1,self.botoncito2,self.botoncito3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)actualizarBotoncitos
{
    int widthPapa = self.mascaraView.superview.frame.size.width;
    
    for (UIView *soyBotoncito in misBotoncitos) {
        
        if( widthPapa - soyBotoncito.frame.origin.x <= self.distanciaDerecha.constant)
        {
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                soyBotoncito.alpha = 1;
                soyBotoncito.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1);
                
            } completion:nil];
        }
        else
        {
            soyBotoncito.alpha = 0;
            soyBotoncito.layer.transform = CATransform3DMakeScale(1, 1, 1);
        }
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    self.mascaraView.backgroundColor = [UIColor greenColor];
}


- (IBAction)seEstaHaciendoPan:(UIPanGestureRecognizer *)sender {
    
    
    
    int traslacionX = [sender translationInView:sender.view.superview].x;
    
    if (self.distanciaDerecha.constant - traslacionX >= 0) {
        self.distanciaDerecha.constant -= traslacionX;
        
        [self actualizarBotoncitos];
    }
    
    
    [sender setTranslation:CGPointZero inView:sender.view.superview];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        if (self.distanciaDerecha.constant > sender.view.superview.frame.size.width/2) {
            
            self.distanciaDerecha.constant = sender.view.superview.frame.size.width;
            
        }
        else
        {
            
            self.distanciaDerecha.constant = 0;
            
        }
        
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            
            [sender.view.superview layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            [self actualizarBotoncitos];
            
        }];
        
        
    }
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.distanciaDerecha.constant = 0;
        [self.mascaraView.superview layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        [self actualizarBotoncitos];
    }];
}

@end
