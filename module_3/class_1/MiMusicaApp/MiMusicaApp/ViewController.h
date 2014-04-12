//
//  ViewController.h
//  MiMusicaApp
//
//  Created by Diego Cruz on 31/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArtistaiPadTableViewController.h"


@interface ViewController : UIViewController <ItemsDelegado,UITableViewDataSource,UICollectionViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout >
{
    UIPopoverController *popOver;
}
@property (weak, nonatomic) IBOutlet UILabel *miLabel;
@end
