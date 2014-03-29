//
//  NoticiasTableViewController.h
//  MultiTouchApp
//
//  Created by Diego Cruz on 28/03/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoticiasDelegado <NSObject>

-(void)seApretoMenuIzquierda;
-(void)seApretoMenuDerecha;

@end

@interface NoticiasTableViewController : UITableViewController

@property (nonatomic,strong) id<NoticiasDelegado> miDelegado;

@end
