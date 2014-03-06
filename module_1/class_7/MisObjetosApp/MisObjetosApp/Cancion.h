//
//  Cancion.h
//  MisObjetosApp
//
//  Created by Diego Cruz on 5/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cancion : NSObject

@property (strong,nonatomic) NSString *titulo;
@property (strong,nonatomic) NSString *nombreArtista;
@property (strong,nonatomic) NSNumber *duracion;
@property (strong,nonatomic) UIImage *albumCover;

@end
