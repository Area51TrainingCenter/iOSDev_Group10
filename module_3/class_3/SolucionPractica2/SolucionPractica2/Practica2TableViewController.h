//
//  Practica2TableViewController.h
//  SolucionPractica2
//
//  Created by Diego Cruz on 4/04/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Practica2TableViewController : UITableViewController
{
    NSArray *misBotoncitos;
}
@property (weak, nonatomic) IBOutlet UIView *mascaraView;
@property (weak, nonatomic) IBOutlet UIView *botoncito1;
@property (weak, nonatomic) IBOutlet UIView *botoncito2;
@property (weak, nonatomic) IBOutlet UIView *botoncito3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distanciaDerecha;

@end
