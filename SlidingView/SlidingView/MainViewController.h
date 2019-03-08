//
//  MainViewController.h
//  MainViewController
//
//  Created by Kyungjung Kim on 07/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController {
    UISwipeGestureRecognizer *upSwipeGesture;
    UIViewController *left;
    UIView *uivTopMenu;
}

- (IBAction)menuOpenBtnClick:(UIButton *)sender;

@end
