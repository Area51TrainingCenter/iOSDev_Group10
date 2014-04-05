//
//  AlbumTableViewCell.h
//  MiMusicaApp
//
//  Created by Diego Cruz on 4/04/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@property (weak, nonatomic) IBOutlet UILabel *anhoLabel;
@property (weak, nonatomic) IBOutlet UILabel *numCancionesLabel;

@end
