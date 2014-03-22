//
//  ViewController.h
//  MultiTouchApp
//
//  Created by iOS on 3/17/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate,UIActionSheetDelegate>
{
    CGPoint puntoInicial;
    
    float escalaActual;
    float rotationActual;
}
@end
