//
//  Cancion.h
//  MiMusicaApp
//
//  Created by Diego Cruz on 31/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Cancion : NSManagedObject

@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSNumber * duracion;
@property (nonatomic, retain) NSNumber * orden;
@property (nonatomic, retain) Album *album;

@end
