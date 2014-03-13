//
//  NuevaCancionTableViewController.h
//  MisObjetosApp
//
//  Created by Diego Cruz on 7/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cancion.h"

@protocol NuevaCancionDelegate <NSObject>

-(void)NuevaCancionSeGuardo:(Cancion *)nuevaCancion;

@end

@interface NuevaCancionTableViewController : UITableViewController <UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate>
{
    Cancion *nuevaCancion;
    BOOL generoSeleccionado;
    NSArray *generos;
}

@property (weak, nonatomic) IBOutlet UILabel *artistaLabel;
@property (weak, nonatomic) IBOutlet UITextField *tituloTextField;
@property (weak, nonatomic) IBOutlet UILabel *duracionLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *generoLabel;

@property (strong,nonatomic) id<NuevaCancionDelegate> miDelegado;
@property (strong,nonatomic) NSMutableArray *canciones;

@end
