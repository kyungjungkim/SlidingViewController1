//
//  MainViewController.h
//  MainViewController
//
//  Created by Kyungjung Kim on 07/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuTableViewCell.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UISwipeGestureRecognizer *upSwipeGesture;
    UITableView *menu;
    BOOL isMenuOpen;
    MenuTableViewCell *cell;
}

- (IBAction)menuOpenBtnClick:(UIButton *)sender;

@end
