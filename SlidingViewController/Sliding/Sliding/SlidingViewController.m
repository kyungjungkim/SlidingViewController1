//
//  SlidingViewController.m
//  Sliding
//
//  Created by Kyungjung Kim on 2020/07/25.
//  Copyright © 2020 prosoft. All rights reserved.
//

#import "SlidingViewController.h"

@interface SlidingViewController ()

@end

@implementation SlidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    m_menu = [UITableView new];
    
    self->m_tag = 0;
    self->isMenuOpen = false;
    isAll1Clicked = true;
    isAll1 = false;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Open the hamburger menu.
- (void)menuOpenBtnClick {
    if (isMenuOpen == NO) {
        [UIView animateWithDuration:0.8f animations:^{
            [self->m_menu setFrame:CGRectMake(0.0f, 30.0f, self->m_menu.frame.size.width - 100.0f, self->m_menu.frame.size.height - 30.0f)];
        } completion:^(BOOL finished) {
            if (finished) {
                self->cell.uiBCheck.frame = CGRectMake(self->cell.uiBCheck.frame.origin.x,
                                                       self->cell.uiBCheck.frame.origin.y - 10.0f,
                                                       self->cell.uiBCheck.frame.size.width,
                                                       self->cell.uiBCheck.frame.size.height);
                [self->cell.uiBCheck setAlpha:1.0f];
            }
        }];

//        [self bringSubviewToFront:m_menu];

        self->isMenuOpen = YES;
    }
}

- (void)swipeMenuClose {
    if (isMenuOpen == YES) {
        [UIView animateWithDuration:0.8f animations:^{
            [self->m_menu setFrame:CGRectMake(-(self->m_menu.frame.size.width - 100.0f), 30.0f, self->m_menu.frame.size.width - 100.0f, self->m_menu.frame.size.height - 30.0f)];
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


#pragma mark - UITableViewDelegate, UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    cell = [MenuTableViewHeaderViewController new];
    cell.delegate = self;
    
    return cell.view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    cell1 = (MenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell1.delegate = self;
    cell1.tag = indexPath.row;
    
    
    if (0 != indexPath.row) {
        cell1.uilGreetings.text = @"";
    }
    
    
    if (isAll1Clicked && clickedSectionNum == 0) { // 전체버튼 클릭
        if (isAll1) { // 선택.
//            [cell1 setSelected:YES animated:YES];
            cell1.uiBCheck.titleLabel.text = @"ON";

            //[[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"YES"];
                
//            if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
                
            [m_menu layoutIfNeeded];
                
            return cell1;
        } else if (!isAll1) { // 해제.
//            [cell1 setSelected:NO animated:YES];
            cell1.uiBCheck.titleLabel.text = @"OFF";
            
            //[selectedName removeObjectAtIndex:indexPath.row];
                
            //[[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"NO"];
                
//            if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
            
            [m_menu layoutIfNeeded];
            
            return cell1;
        }
    } else {
        if (m_tag == indexPath.row) {
            if ([@"OFF" isEqual:cell1.uiBCheck.titleLabel.text]) {
                [cell1.uiBCheck setTitle:@"ON" forState:UIControlStateNormal];
                [cell1.uiBCheck setTitle:@"ON" forState:UIControlStateHighlighted];
                [cell1.uiBCheck setTitle:@"ON" forState:UIControlStateSelected];
                
                [m_menu layoutIfNeeded];
                
                return cell1;
            } else {
                [cell1.uiBCheck setTitle:@"OFF" forState:UIControlStateNormal];
                [cell1.uiBCheck setTitle:@"OFF" forState:UIControlStateHighlighted];
                [cell1.uiBCheck setTitle:@"OFF" forState:UIControlStateSelected];
                
                [m_menu layoutIfNeeded];
                
                return cell1;
            }
        }
    }
    
    return cell1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelect");
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    return @"";
}

#pragma mark - HeaderCellDelegate

- (void)clickedBtnAll {
    isAll1 = !isAll1;
    
    isAll1Clicked = true;
    clickedSectionNum = 0;
    
    [m_menu reloadData];
}


#pragma mark - TableViewCellDelegate

- (void)clickedBtnCheckWithTag:(long)tag {
    NSLog(@"tag: %ld", tag);
    
    isAll1Clicked = false;
    m_tag = tag;
    
    [m_menu reloadData];
}

@end
