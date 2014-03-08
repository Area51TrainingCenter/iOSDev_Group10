//
//  Cancion.m
//  MisObjetosApp
//
//  Created by Diego Cruz on 5/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "Cancion.h"

@implementation Cancion


-(NSString *)obtenerDuracionFormateada
{
    int minutos = self.duracion.intValue /60;
    int segundos = self.duracion.intValue % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d",minutos,segundos];
}


@end
