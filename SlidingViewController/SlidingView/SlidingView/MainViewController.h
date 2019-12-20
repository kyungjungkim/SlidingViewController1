//
//  MainViewController.h
//  MainViewController
//
//  Created by Kyungjung Kim on 07/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuTableViewHeaderCell.h"
#import "MenuTableViewCell.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UISwipeGestureRecognizer *upSwipeGesture;
    
    UITableView *menu;
    MenuTableViewHeaderCell *cell;
    MenuTableViewCell *cell1;
    
    BOOL isAll1Clicked;
    BOOL clickedSectionNum;
    BOOL isAll1;
    BOOL isMenuOpen;
}

@property (nonatomic) UITableView *menu;
@property (nonatomic) MenuTableViewHeaderCell *cell;
@property (nonatomic) MenuTableViewCell *cell1;

@property (weak, nonatomic) IBOutlet UIScrollView *uiScrollView;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView1;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView2;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView3;


- (IBAction)menuOpenBtnClick:(UIButton *)sender;

@end