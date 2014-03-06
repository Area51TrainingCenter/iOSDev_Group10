//
//  CancionCell.h
//  MisObjetosApp
//
//  Created by Diego Cruz on 5/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CancionCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *albumCoverView;
@property (strong, nonatomic) IBOutlet UILabel *tituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *artistaLabel;
@property (strong, nonatomic) IBOutlet UILabel *duracionLabel;

@end
