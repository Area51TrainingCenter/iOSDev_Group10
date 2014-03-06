//
//  MisCancionesTableViewController.m
//  MisObjetosApp
//
//  Created by Diego Cruz on 5/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "MisCancionesTableViewController.h"
#import "CancionCell.h"
#import "Cancion.h"

@interface MisCancionesTableViewController ()

@end

@implementation MisCancionesTableViewController

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
    
    //Aqui creamos y llenamos el arreglo de canciones
    canciones = [NSMutableArray array];
    
    //Aqui llenamos canciones con el .plist
    //0. Obtengo el .plist
    //1. Meto el contenido del plist en un arreglo
    //2. Por cada item, creo una Cancion y lo meto al arreglo
    
    NSString *pathCanciones = [[NSBundle mainBundle] pathForResource:@"Canciones" ofType:@"plist"];
    NSArray *cancionesEnPlist = [NSArray arrayWithContentsOfFile:pathCanciones];
    
    for (NSDictionary *soyCancionPlist in cancionesEnPlist) {
        
        Cancion *nuevaCancion = [[Cancion alloc] init];
        
        //
        nuevaCancion.titulo = soyCancionPlist[@"titulo"];
        nuevaCancion.nombreArtista = soyCancionPlist[@"nombreArtista"];
        nuevaCancion.duracion = soyCancionPlist[@"duracion"];
        nuevaCancion.albumCover = [UIImage imageNamed:soyCancionPlist[@"albumCover"]];
        //
        
        [canciones addObject:nuevaCancion];
    }

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return canciones.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cancionCell";
    CancionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    // ??
    
    Cancion *soyCancion = canciones[indexPath.row];
    
    int minutos = soyCancion.duracion.intValue / 60;
    int segundos = soyCancion.duracion.intValue % 60;
    
    cell.tituloLabel.text = soyCancion.titulo;
    cell.artistaLabel.text = soyCancion.nombreArtista;
    cell.albumCoverView.image = soyCancion.albumCover;
    
    cell.duracionLabel.text = [NSString stringWithFormat:@"%02d:%02d",minutos,segundos];
    
    return cell;
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.tableView indexPathForSelectedRow];
}

@end
