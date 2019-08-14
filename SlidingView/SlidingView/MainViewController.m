//
//  MainViewController.m
//  MainViewController
//
//  Created by Kyungjung Kim on 2018. 8. 28..
//  Copyright © Kyungjung Kim. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    isMenuOpen = NO;
    
    menu = [[UITableView alloc] init];
    menu.dataSource = self;
    menu.delegate = self;
    [menu setFrame:CGRectMake(-(self.view.frame.size.width - 100.0f), 20.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 20.0f)];
    menu.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    menu.backgroundColor = UIColor.lightGrayColor;
    menu.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:menu];
    
    // UISwipeGesture
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMenuClose)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [menu addGestureRecognizer:leftSwipeGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
//    [locationManager stopUpdatingLocation];
    
    [super viewWillAppear:animated];
}


#pragma mark - IBAction methods

// Open the hamburger menu.
- (IBAction)menuOpenBtnClick:(UIButton *)sender {
    if (isMenuOpen == NO) {
        [UIView animateWithDuration:0.5f animations:^{
            [self->menu setFrame:CGRectMake(0.0f, 20.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 20.0f)];
        } completion:^(BOOL finished) {
            if (finished) {
                self->cell.uilGreetings.frame = CGRectMake(self->cell.uilGreetings.frame.origin.x, self->cell.uilGreetings.frame.origin.y - 20.0f,
                                                 self->cell.uilGreetings.frame.size.width, self->cell.uilGreetings.frame.size.height);
                [self->cell.uilGreetings setAlpha:1.0f];
                
                self->isMenuOpen = YES;
            }
        }];
    }
}

- (void)swipeMenuClose {
    if (isMenuOpen == YES) {
        [UIView animateWithDuration:0.5f animations:^{
            [self->menu setFrame:CGRectMake(-(self.view.frame.size.width - 100.0f), 20.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 20.0f)];
        } completion:^(BOOL finished) {
            if (finished) {
                self->cell.uilGreetings.frame = CGRectMake(self->cell.uilGreetings.frame.origin.x, self->cell.uilGreetings.frame.origin.y + 20,
                                                       self->cell.uilGreetings.frame.size.width, self->cell.uilGreetings.frame.size.height);
                [self->cell.uilGreetings setAlpha:1.0f];
                
                self->isMenuOpen = NO;
            }
        }];
    }
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    cell = (MenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    /*
        if (isAll1Clicked && clickedSectionNum == 0) { // 전체버튼 클릭
            if (isAll1) { // 선택.
                [cell setSelected:YES animated:YES];
                [selectedName addObject:cell.nameLbl.text];

                [[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"YES"];
                
                if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
                    isAll1Clicked = NO;
                
                [officerSearchTableview layoutIfNeeded];
                
                return cell;
            } else if (!isAll1) { // 해제.
                [cell setSelected:NO animated:YES];
                [selectedName removeObjectAtIndex:indexPath.row];
                
                [[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"NO"];
                
                if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
                    isAll1Clicked = NO;
                
                [officerSearchTableview layoutIfNeeded];
            }
        }
    */
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
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


@end
