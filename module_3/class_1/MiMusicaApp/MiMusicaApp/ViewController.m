//
//  ViewController.m
//  MiMusicaApp
//
//  Created by Diego Cruz on 31/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "ViewController.h"
#import "Album.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)seApretoBotoncito:(UIBarButtonItem *)sender {
    
    UIActionSheet *miSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Guardar en Carrete",@"Opciones", nil];
    
    [miSheet showFromBarButtonItem:sender animated:YES];
    
}

- (IBAction)seApretoCompartir:(UIBarButtonItem *)sender {
    
    UIActivityViewController *miActivity = [[UIActivityViewController alloc] initWithActivityItems:@[@"Ola que ase"] applicationActivities:nil];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        
        [self presentViewController:miActivity animated:YES completion:nil];
        
    }
    else
    {
        popOver = [[UIPopoverController alloc] initWithContentViewController:miActivity];
        [popOver presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"albumSegue"]) {
        
        UIStoryboardPopoverSegue *popOverSegue = (UIStoryboardPopoverSegue *)segue;
        popOver = popOverSegue.popoverController;
        
        ArtistaiPadTableViewController *destino= (ArtistaiPadTableViewController *)popOverSegue.popoverController.contentViewController;
        
        NSArray *albumes = [Album allOrderedBy:@"titulo" ascending:YES];
        destino.items = albumes;
        destino.miDelegado = self;
        
        [popOver setPopoverContentSize:CGSizeMake(320, 44*albumes.count) animated:YES];
        
    }
    
    
    
    
}


-(void)seSeleccionoItem:(NSString *)itemSeleccionado
{
    self.miLabel.text = itemSeleccionado;
    [popOver dismissPopoverAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
