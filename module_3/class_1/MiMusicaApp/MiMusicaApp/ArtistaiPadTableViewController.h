//
//  ArtistaiPadTableViewController.h
//  MiMusicaApp
//
//  Created by Diego Cruz on 7/04/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ItemsDelegado <NSObject>

-(void)seSeleccionoItem:(NSString *)itemSeleccionado;

@end

@interface ArtistaiPadTableViewController : UITableViewController

@property (strong,nonatomic) NSArray *items;
@property (strong,nonatomic) id<ItemsDelegado> miDelegado;


@end
