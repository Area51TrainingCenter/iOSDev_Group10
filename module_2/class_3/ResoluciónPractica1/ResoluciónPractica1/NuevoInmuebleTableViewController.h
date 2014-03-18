//
//  NuevoInmuebleTableViewController.h
//  ResoluciónPractica1
//
//  Created by Diego Cruz on 17/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NuevoInmuebleTableViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *tipos;
}
@property (weak, nonatomic) IBOutlet UITextField *nombreTextfield;
@property (weak, nonatomic) IBOutlet UILabel *tipoLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *tiposPickerView;

@property (strong, nonatomic) NSMutableArray *inmueblesVenta;
@property (strong, nonatomic) NSMutableArray *inmueblesAlquiler;

@end
