//
//  Sliding.h
//  Sliding
//
//  Created by Kyungjung Kim on 2020/07/25.
//  Copyright © 2020 prosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuTable/MenuTableViewCell.h"
#import "MenuTable/MenuTableViewHeaderViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sliding : UIViewController <UITableViewDelegate, UITableViewDataSource, HeaderViewCellDelegate, TableViewCellDelegate> {
    MenuTableViewHeaderViewController *cell;
    MenuTableViewCell *cell1;
    long m_tag;
    
    BOOL isMenuOpen;
    
    UITableView *m_menu;
}

@end

NS_ASSUME_NONNULL_END
