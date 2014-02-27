//
//  ChanchaTableViewController.h
//  IBActionAppGrupo10
//
//  Created by IOS on 24/02/14.
//  Copyright (c) 2014 Area 51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChanchoTableViewController : UITableViewController <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *montoCuentaTextField;
@property (strong, nonatomic) IBOutlet UITextField *propinaTextField;
@property (strong, nonatomic) IBOutlet UILabel *resultadoLabel;
@property (strong, nonatomic) IBOutlet UILabel *personaslLabel;

@property (strong, nonatomic) IBOutlet UIStepper *personasStepper;

- (IBAction)textFieldCambio:(UITextField *)sender;
@end
