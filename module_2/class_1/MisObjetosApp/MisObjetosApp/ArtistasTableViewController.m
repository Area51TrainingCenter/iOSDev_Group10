//
//  ArtistasTableViewController.m
//  MisObjetosApp
//
//  Created by Diego Cruz on 12/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "ArtistasTableViewController.h"

@interface ArtistasTableViewController ()

@end

@implementation ArtistasTableViewController

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
    artistas = @[@"Miley Cyrus", @"Cher", @"Madonna", @"Trigesa del Oriente"];
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
    return artistas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistaCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = artistas[indexPath.row];
    
    if ([artistas[indexPath.row] isEqualToString:self.miCancion.nombreArtista]) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //Si no está chekeada, la chekeo y regreso
    //Si ESTÁ chekeada, la deschekeo
    
    UITableViewCell *soyCelda = [tableView cellForRowAtIndexPath:indexPath];
    
    if (soyCelda.accessoryType == UITableViewCellAccessoryCheckmark) {
        
        soyCelda.accessoryType = UITableViewCellAccessoryNone;
        self.miCancion.nombreArtista = @"";
    }
    else
    {
        soyCelda.accessoryType = UITableViewCellAccessoryCheckmark;
        
        //1.
        NSString *artistaSeleccionado = artistas[indexPath.row];
        //2.
        self.miCancion.nombreArtista = artistaSeleccionado;
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    
    //self.navigationController pushViewController:(UIViewController *) animated:<#(BOOL)#>
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
