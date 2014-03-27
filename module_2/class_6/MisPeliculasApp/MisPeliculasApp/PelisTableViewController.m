//
//  PelisTableViewController.m
//  MisPeliculasApp
//
//  Created by Diego Cruz on 26/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "PelisTableViewController.h"
#import "Pelicula.h"
#import "PeliCollectionCell.h"
#import "PeliTableViewCell.h"

@interface PelisTableViewController ()

@end

@implementation PelisTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSMutableArray * peliculas = [NSMutableArray array];
    NSString *pathPlist = [[NSBundle mainBundle] pathForResource:@"PeliculasList" ofType:@"plist"];
    
    NSArray *peliculasPlist = [NSArray arrayWithContentsOfFile:pathPlist];
    
    for (NSDictionary *peliDictionary in peliculasPlist) {
        
        Pelicula *nuevaPeli = [[Pelicula alloc] init];
        
        
        nuevaPeli.nombre = peliDictionary[@"nombre"];
        nuevaPeli.anho = peliDictionary[@"anho"];
        nuevaPeli.posterImage = [UIImage imageNamed:peliDictionary[@"posterImage"]];
        
        [peliculas addObject:nuevaPeli];
    }
    
    NSDictionary *recomendados = @{@"titulo": @"Recomendados para ti",@"coleccion":peliculas};
    NSDictionary *estreno = @{@"titulo": @"Estreno esta semana",@"coleccion":peliculas};
    NSDictionary *cartelera = @{@"titulo": @"Cartelera",@"coleccion":peliculas};
    
    colecciones = @[recomendados,estreno,cartelera];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return colecciones.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return colecciones[section][@"titulo"];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *nombrePlantilla = @"peliTableCell";
    
    if (indexPath.section == colecciones.count -1) {
        nombrePlantilla = @"carteleraCell";
    }
    
    PeliTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nombrePlantilla forIndexPath:indexPath];
    
    // Configure the cell...
    cell.miCollectionView.tag = indexPath.section+1;
    [cell.miCollectionView reloadData];

    return cell;
}


#pragma mark Metodos del CollectionView
-(int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag > 0) {
        return ((NSArray *)colecciones[collectionView.tag-1][@"coleccion"]).count;
    }
    else
    {
        return 0;
    }
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PeliCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"peliCell" forIndexPath:indexPath];
    
    Pelicula *soyPelicula = colecciones[collectionView.tag-1][@"coleccion"][indexPath.row];
    
    cell.nombreLabel.text = soyPelicula.nombre;
    cell.posterView.image = soyPelicula.posterImage;
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < colecciones.count-1) {
        return 149;
    }
    else
    {
        int numPelis = ((NSArray *)colecciones[2][@"coleccion"]).count;
        int numFilas = floorf(numPelis/3)+ ((numPelis%3)?1:0);
        
        //expresion?valor1:valor2 es:
        /*
         if(expresion)
            {
                return valor1;
            }
         else
         {
                return valor2;
         }
         */
        
        return numFilas*126 + 20 + 10*(numFilas-1);
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
