//
//  Sliding.m
//  Sliding
//
//  Created by Kyungjung Kim on 2020/03/19.
//  Copyright © 2020 prosoft. All rights reserved.
//

#import "Sliding.h"

#import "MenuTable/MenuTableViewCell.h"
#import "MenuTable/MenuTableViewHeaderViewController.h"


@implementation Sliding {
    UITableView *menu;
    MenuTableViewHeaderViewController *cell;
    MenuTableViewCell *cell1;
    long m_tag;
    
    BOOL isMenuOpen;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


//- (void)init {
//    isMenuOpen = NO;
//}

// Open the hamburger menu.
- (void)menuOpenBtnClick {
    if (isMenuOpen == NO) {
        [UIView animateWithDuration:0.8f animations:^{
            [self->menu setFrame:CGRectMake(0.0f, 30.0f, self.bounds.size.width - 100.0f, self.bounds.size.height - 30.0f)];
        } completion:^(BOOL finished) {
            if (finished) {
                self->cell.uiBCheck.frame = CGRectMake(self->cell.uiBCheck.frame.origin.x,
                                                       self->cell.uiBCheck.frame.origin.y - 10.0f,
                                                       self->cell.uiBCheck.frame.size.width,
                                                       self->cell.uiBCheck.frame.size.height);
                [self->cell.uiBCheck setAlpha:1.0f];
            }
        }];
        
        [self bringSubviewToFront:menu];
        
        self->isMenuOpen = YES;
    }
}

- (void)swipeMenuClose {
    if (isMenuOpen == YES) {
        [UIView animateWithDuration:0.8f animations:^{
            [self->menu setFrame:CGRectMake(-(self.bounds.size.width - 100.0f), 30.0f, self.bounds.size.width - 100.0f, self.bounds.size.height - 30.0f)];
        } completion:^(BOOL finished) {
            if (finished) {
                self->cell.uiBCheck.frame = CGRectMake(self->cell.uiBCheck.frame.origin.x,
                                                       self->cell.uiBCheck.frame.origin.y + 10.0f,
                                                       self->cell.uiBCheck.frame.size.width,
                                                       self->cell.uiBCheck.frame.size.height);
                [self->cell.uiBCheck setAlpha:1.0f];
                
                self->isMenuOpen = NO;
            }
        }];
    }
}


@end
