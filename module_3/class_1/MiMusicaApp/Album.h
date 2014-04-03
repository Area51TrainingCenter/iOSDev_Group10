//
//  Album.h
//  MiMusicaApp
//
//  Created by Diego Cruz on 31/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Artista, Cancion;

@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSNumber * anho;
@property (nonatomic, retain) NSSet *canciones;
@property (nonatomic, retain) Artista *artista;
@end

@interface Album (CoreDataGeneratedAccessors)

- (void)addCancionesObject:(Cancion *)value;
- (void)removeCancionesObject:(Cancion *)value;
- (void)addCanciones:(NSSet *)values;
- (void)removeCanciones:(NSSet *)values;

@end
