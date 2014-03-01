//
//  ContactoCell.h
//  MiTablaAppGrupo10
//
//  Created by Diego Cruz on 28/02/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nombreContactoLabel;
@property (strong, nonatomic) IBOutlet UISwitch *favoritoSwitch;

@end
