//
//  MultimediaTableViewController.m
//  MiMultimediaApp
//
//  Created by iOS on 4/14/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import "MultimediaTableViewController.h"

@interface MultimediaTableViewController ()

@end

@implementation MultimediaTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        NSURL *peliURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mp4"]];
        
        miMovieViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:peliURL];
        
        [self presentMoviePlayerViewControllerAnimated:miMovieViewController];
    }
    else if (indexPath.section == 1 && indexPath.row ==0)
    {
        
        miAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:nil error:nil];
        
        [miAudioPlayer play];
        [miAudioPlayer pause];
        [miAudioPlayer setVolume:120];
        [miAudioPlayer setCurrentTime:60];
        
    }
}

- (IBAction)seApreto2doVideoPlay:(UIButton *)sender {
    
    if (!movieReproductor) {
        NSURL *peliURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mp4"]];
        
        movieReproductor = [[MPMoviePlayerController alloc] initWithContentURL:peliURL];
        movieReproductor.view.frame = self.canvasMovie.bounds;
        
        [movieReproductor prepareToPlay];
       /* movieReproductor.shouldAutoplay;
        movieReproductor.fullscreen;
        movieReproductor.controlStyle;
        [movieReproductor setCurrentPlaybackTime:120];
        movieReproductor.allowsAirPlay;
        */
        [self.canvasMovie addSubview:movieReproductor.view];
    }
    
}


@end
