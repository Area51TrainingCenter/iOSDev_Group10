//
//  MisNotasTableViewController.m
//  MITablaNotasApp
//
//  Created by Diego Cruz on 3/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "MisNotasTableViewController.h"
#import "NotaCell.h"

@interface MisNotasTableViewController ()

@end

@implementation MisNotasTableViewController

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
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    //1. Creen el arreglo
    // El arreglo NO tiene que estar vacio
    // @"" x n veces (siendo n el numero de filas de la tabla)
    misNotas = [NSMutableArray array];
    
    
    /*
    for (NSString *soyNota in misNotas) {

    }
     */
    /*
    [misNotas containsObject:@"PIkachu"];
    [misNotas indexOfObject:@"PIkachu"];*/
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


- (IBAction)seApretoAnhadirNota:(UIBarButtonItem *)sender {
    
    //1. Modificar la data
    //2. Modificas la tabla (NO Reload)
    
    [self.tableView beginUpdates];
        [misNotas addObject:@""];
    
        NSIndexPath *nuevoIndexPath = [NSIndexPath indexPathForRow:misNotas.count-1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[nuevoIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.tableView endUpdates];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return misNotas.count;
}
- (IBAction)miTextFieldCambio:(UITextField *)sender {
    
    //1. Identificar a qué fila pertece
    //2. Modificar el item de esa fila
    int indice = sender.tag;
    misNotas[indice] = sender.text;
    
    //[misNotas replaceObjectAtIndex:indice withObject:sender.text];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NotaCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.miTextField.text = misNotas[indexPath.row];
    cell.miTextField.tag = indexPath.row;
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        [misNotas removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    //1. Actualizamos la data
    
    NSString *notaMovida = misNotas[fromIndexPath.row];
    //Lo eliminamos de su posicion actual
    //Y lo reinsertamos en la nueva posicion
    
    [misNotas removeObjectAtIndex:fromIndexPath.row];
    [misNotas insertObject:notaMovida atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    
    return YES;
}


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
