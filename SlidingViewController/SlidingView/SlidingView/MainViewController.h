//
//  MainViewController.h
//  MainViewController
//
//  Created by Kyungjung Kim on 07/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuTableViewHeaderViewController.h"
#import "MenuTableViewCell.h"


@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, HeaderViewCellDelegate, TableViewCellDelegate> {
    UISwipeGestureRecognizer *upSwipeGesture;
    
    UITableView *menu;
    MenuTableViewHeaderViewController *cell;
    MenuTableViewCell *cell1;
    long m_tag;
    
    BOOL isMenuOpen;
}

@property (nonatomic) UITableView *menu;
@property (nonatomic) MenuTableViewHeaderViewController *cell;
@property (nonatomic) MenuTableViewCell *cell1;

@property (weak, nonatomic) IBOutlet UIScrollView *uiScrollView;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView1;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView2;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView3;


- (IBAction)menuOpenBtnClick:(UIButton *)sender;

@end
