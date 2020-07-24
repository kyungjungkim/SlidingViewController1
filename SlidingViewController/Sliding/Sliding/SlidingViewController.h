//
//  SlidingViewController.h
//  Sliding
//
//  Created by Kyungjung Kim on 2020/07/25.
//  Copyright © 2020 prosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuTableView/MenuTableViewCell.h"
#import "MenuTableView/MenuTableViewHeaderViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SlidingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, HeaderViewCellDelegate, TableViewCellDelegate> {
    MenuTableViewHeaderViewController *cell;
    MenuTableViewCell *cell1;
    long m_tag;
    
    BOOL isMenuOpen;
    
    UITableView *m_menu;
}

@end

NS_ASSUME_NONNULL_END
