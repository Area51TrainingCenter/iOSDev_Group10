//
//  ViewController.h
//  TutorialApp
//
//  Created by Diego Cruz on 26/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    NSArray *misContainers;
}

@property (weak, nonatomic) IBOutlet UIScrollView *miSCrollView;

/*container hijos*/
@property (strong, nonatomic) IBOutlet UIView *container1View;
@property (strong, nonatomic) IBOutlet UIView *container2View;
@property (strong, nonatomic) IBOutlet UIView *container3View;
@property (weak, nonatomic) IBOutlet UIPageControl *miPageControl;

@end
