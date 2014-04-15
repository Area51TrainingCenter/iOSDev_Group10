//
//  JUViewController.m
//  MiMapaApp
//
//  Created by iOS on 4/14/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "JUViewController.h"

@interface JUViewController ()

@end

@implementation JUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    MKPointAnnotation *miPunto = [[MKPointAnnotation alloc] init];
    
    miPunto.title = @"Ovalo";
    miPunto.coordinate = CLLocationCoordinate2DMake(-12.119107, -77.039899);
    
    [self.miMapa addAnnotation:miPunto];
    
    
    [self seteaMapaConCentro:miPunto.coordinate];
}

-(void)seteaMapaConCentro:(CLLocationCoordinate2D) soyCentro
{
    MKCoordinateRegion miRegion = MKCoordinateRegionMakeWithDistance(soyCentro, 500, 500);
    
    MKCoordinateRegion regionAjustada = [self.miMapa regionThatFits:miRegion];
    
    [self.miMapa setRegion:regionAjustada animated:YES];
}

- (IBAction)seHizoLongPress:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint soyPunto = [sender locationOfTouch:0 inView:sender.view];
        
        MKPointAnnotation *nuevoPunto = [[MKPointAnnotation alloc] init];
        //Convertimos soyPunto en (long,lati)
        nuevoPunto.coordinate = self.miMapa.centerCoordinate;
        
        [self.miMapa addAnnotation:nuevoPunto];
    }
    
    
}

- (IBAction)toogleMiUbicacion:(UIBarButtonItem *)sender {
    
    if (self.miMapa.showsUserLocation) {
        self.miMapa.showsUserLocation = NO;
        
        [self seteaMapaConCentro:((MKPointAnnotation *)self.miMapa.annotations[0]).coordinate];
    }
    else
    {
        self.miMapa.showsUserLocation = YES;
    }
}

- (IBAction)cambioTipoMapa:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.miMapa.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.miMapa.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.miMapa.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self seteaMapaConCentro:userLocation.coordinate];
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    
    MKPinAnnotationView *miPin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"miPlantillaPin"];
    
    if (!miPin) {
        miPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"miPlantillaPin"];
    }
    else
    {
        miPin.annotation=annotation;
    }
    miPin.animatesDrop = YES;
    miPin.canShowCallout = YES;
    miPin.pinColor = MKPinAnnotationColorGreen;
    miPin.draggable = YES;
    
    return miPin;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
