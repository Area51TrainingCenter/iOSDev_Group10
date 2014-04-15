//
//  MultimediaTableViewController.h
//  MiMultimediaApp
//
//  Created by iOS on 4/14/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface MultimediaTableViewController : UITableViewController
{
    MPMoviePlayerViewController *miMovieViewController;
    MPMoviePlayerController *movieReproductor;
    
    
    AVAudioPlayer *miAudioPlayer;
    
}
@property (weak, nonatomic) IBOutlet UIView *canvasMovie;
@end
