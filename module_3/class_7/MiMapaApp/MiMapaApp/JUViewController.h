//
//  JUViewController.h
//  MiMapaApp
//
//  Created by iOS on 4/14/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface JUViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *miMapa;

@end
