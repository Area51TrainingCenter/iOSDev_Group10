//
//  ViewController.m
//  TutorialApp
//
//  Created by Diego Cruz on 26/03/14.
//  Copyright (c) 2014 Diego Cruz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    misContainers = @[self.container1View,self.container2View,self.container3View];
    self.miPageControl.numberOfPages = misContainers.count;
    
    /*
    UIViewController *v = [self.storyboard instantiateViewControllerWithIdentifier:@"navInicioScene"];
     */
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CGRect scrollFrame = self.miSCrollView.bounds;

    for(int k=0;k<misContainers.count;k++)
    {
        CGRect soyFrame = scrollFrame;
        soyFrame.origin.x += soyFrame.size.width*k;
        ((UIView *)misContainers[k]).frame = soyFrame;
        [self.miSCrollView addSubview:misContainers[k]];
    }
    
    [self.miSCrollView setContentSize:CGSizeMake(self.miSCrollView.frame.size.width*misContainers.count, self.miSCrollView.frame.size.height)];

    
    
    [self performSelector:@selector(scrollearAPaso:) withObject:@1 afterDelay:2.0];
}

- (IBAction)cambioBolita:(UIPageControl *)sender {
    
    [self scrollearAPaso:@(sender.currentPage)];
}


-(void)scrollearAPaso:(NSNumber *)numPaso
{
    //Aqui va el scrolleo :)
    
    [self.miSCrollView scrollRectToVisible:((UIView *)misContainers[numPaso.intValue]).frame animated:YES];
    
    [self performSelector:@selector(scrollViewDidEndDecelerating:) withObject:self.miSCrollView afterDelay:0.4];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.miPageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
