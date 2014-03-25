//
//  PeliculasViewController.m
//  MisPeliculasApp
//
//  Created by Diego Cruz on 24/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "PeliculasViewController.h"
#import "PeliculaCell.h"
#import "Pelicula.h"

@interface PeliculasViewController ()

@end

@implementation PeliculasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    peliculas = [NSMutableArray array];
    NSString *pathPlist = [[NSBundle mainBundle] pathForResource:@"PeliculasList" ofType:@"plist"];
    
    NSArray *peliculasPlist = [NSArray arrayWithContentsOfFile:pathPlist];
    
    for (NSDictionary *peliDictionary in peliculasPlist) {
        
        Pelicula *nuevaPeli = [[Pelicula alloc] init];
        
        nuevaPeli.nombre = peliDictionary[@"nombre"];
        nuevaPeli.anho = peliDictionary[@"anho"];
        nuevaPeli.posterImage = [UIImage imageNamed:peliDictionary[@"posterImage"]];
        
        [peliculas addObject:nuevaPeli];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return peliculas.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PeliculaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"peliCell" forIndexPath:indexPath];
    
    Pelicula *soyPeli = peliculas[indexPath.row];
    
    cell.posterView.image = soyPeli.posterImage;
    cell.nombreLabel.text = soyPeli.nombre;
    cell.anhoLabel.text = soyPeli.anho;
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
