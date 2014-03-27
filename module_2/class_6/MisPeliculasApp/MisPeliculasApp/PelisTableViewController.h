//
//  PelisTableViewController.h
//  MisPeliculasApp
//
//  Created by Diego Cruz on 26/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PelisTableViewController : UITableViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSArray *colecciones;
}
@end
