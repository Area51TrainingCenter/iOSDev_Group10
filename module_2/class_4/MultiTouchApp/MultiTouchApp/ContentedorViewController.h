//
//  ContentedorViewController.h
//  MultiTouchApp
//
//  Created by iOS on 3/19/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoticiasTableViewController.h"

@interface ContentedorViewController : UIViewController <NoticiasDelegado>
{
    int topeDerecha;
    int topeIzquierda;
    int superX;
}

@property (weak, nonatomic) IBOutlet UIView *leftMenuView;
@property (weak, nonatomic) IBOutlet UIView *rightMenuView;
@property (weak, nonatomic) IBOutlet UIView *centerView;

@end
