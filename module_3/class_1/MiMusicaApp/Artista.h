//
//  Artista.h
//  MiMusicaApp
//
//  Created by Diego Cruz on 31/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Artista : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSDate * fechaNacimiento;
@property (nonatomic, retain) NSSet *albumes;
@end

@interface Artista (CoreDataGeneratedAccessors)

- (void)addAlbumesObject:(Album *)value;
- (void)removeAlbumesObject:(Album *)value;
- (void)addAlbumes:(NSSet *)values;
- (void)removeAlbumes:(NSSet *)values;

@end
