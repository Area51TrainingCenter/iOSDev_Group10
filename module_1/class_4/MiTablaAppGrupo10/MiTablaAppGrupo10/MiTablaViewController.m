//
//  MiTablaViewController.m
//  MiTablaAppGrupo10
//
//  Created by Diego Cruz on 26/02/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "MiTablaViewController.h"
#import "ContactoCell.h"
#import "MiTabBarController.h"

@interface MiTablaViewController ()

@end

@implementation MiTablaViewController

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
    // self.navigationItem.rightBarButtonItem =
    
    /*
    //Manera 1
    misContactos = [NSArray arrayWithObjects:@"Fabiola",@"Stephanie", @"Chuck", @"Clint",@"Bugs", nil];
     */
    /*
    self.navigationController;
    self.tabBarController;
    */
     
    //Manera 2
    misContactos = @[@"Miley Cyrus",@"Stephanie Cayo", @"Chuck Norris", @"Clint Eastwood",@"Bugs Bunny"];
    
    //Universo Paralelo
    /*
    [NSNumber numberWithInt:0];
    
    misContactos = @[@0,@30,@4,@5];
     */
    
    NSMutableArray *soyMu = [NSMutableArray array];
}

- (IBAction)switchCambio:(UISwitch *)sender {
    
    //Aca hacemos:
    //1. Identificamos de qué fila se trata
    //2. Metemos/sacamos acorde al valor del switch
    
    int indiceContacto = sender.tag;
    
    sender.isOn;
    
    MiTabBarController *miTab = (MiTabBarController *)self.tabBarController;
    
    if (sender.isOn) {
        <#statements#>
    }
    else
    {
        
    }
    
    NSString *stringJulia =@"Julia Roberts";
    
    [miTab.misFavoritos addObject:stringJulia];
    [miTab.misFavoritos removeObject:@"Julia Roberts"];
    
    //[self.tableView reloadData];
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
    //IMPORTANTE: Si el arreglo es nil, .count
    
    return misContactos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"miCelda";
    ContactoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *contactoActual = misContactos[indexPath.row]; //[misContactos objectAtIndex:0];
    cell.nombreContactoLabel.text = contactoActual;
    cell.favoritoSwitch.tag = indexPath.row;
    
    
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

@end
