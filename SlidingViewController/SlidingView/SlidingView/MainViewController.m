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

@synthesize uiScrollView, uiTableView1, uiTableView2, uiTableView3, menu, cell, cell1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    isMenuOpen = NO;
    
    menu = [[UITableView alloc] init];
    menu.delegate = self;
    menu.dataSource = self;
    menu.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    menu.backgroundColor = UIColor.lightGrayColor;
    //    menu.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //    [menu setFrame:CGRectMake(-(self.view.frame.size.width - 100.0f), 30.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 20.0f)];
    
    [menu setFrame:CGRectMake(-(self.view.frame.size.width - 100.0f), 30.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 20.0f)];
    
    [menu registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    [self.view addSubview:menu];
    
    
    // UISwipeGesture
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMenuClose)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [menu addGestureRecognizer:leftSwipeGesture];
    
    
    
    [uiScrollView setContentSize:CGSizeMake(uiScrollView.frame.size.width * 3, uiScrollView.frame.size.height)];
    
    [uiTableView1 setFrame:CGRectMake(0.0f, 0.0f, uiScrollView.frame.size.width, uiScrollView.frame.size.height)];
    [uiTableView2 setFrame:CGRectMake(uiScrollView.frame.size.width, 0.0f, uiScrollView.frame.size.width, uiScrollView.frame.size.height)];
    [uiTableView3 setFrame:CGRectMake(uiScrollView.frame.size.width * 2, 0.0f, uiScrollView.frame.size.width, uiScrollView.frame.size.height)];
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
        [UIView animateWithDuration:0.8f animations:^{
            [self->menu setFrame:CGRectMake(0.0f, 30.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 30.0f)];
        } completion:^(BOOL finished) {
            if (finished) {
                self->cell.uiBCheck.frame = CGRectMake(self->cell.uiBCheck.frame.origin.x,
                                                       self->cell.uiBCheck.frame.origin.y - 10.0f,
                                                       self->cell.uiBCheck.frame.size.width,
                                                       self->cell.uiBCheck.frame.size.height);
                [self->cell.uiBCheck setAlpha:1.0f];
            }
        }];
        
        [self.view bringSubviewToFront:menu];
        
        self->isMenuOpen = YES;
    }
}

- (void)swipeMenuClose {
    if (isMenuOpen == YES) {
        [UIView animateWithDuration:0.8f animations:^{
            [self->menu setFrame:CGRectMake(-(self.view.frame.size.width - 100.0f), 30.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 30.0f)];
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
    if (cell1 == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuTableViewCell" owner:self options:nil];
        cell1 = [nib objectAtIndex:0];
    }
    
    if (0 != indexPath.row) {
        cell1.uilGreetings.text = @"";
    }
    
    
    NSLog(@"isAll1: %d", isAll1);
    NSLog(@"isAll1Clicked: %d, clickedSectionNum: %d", isAll1Clicked, clickedSectionNum);
    if (isAll1Clicked && clickedSectionNum == 0) { // 전체버튼 클릭
        if (isAll1) { // 선택.
//            [cell1 setSelected:YES animated:YES];
            cell1.uiBCheck.titleLabel.text = @"ON";

            //[[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"YES"];
                
//            if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
                
            [menu layoutIfNeeded];
                
            return cell1;
        } else if (!isAll1) { // 해제.
//            [cell1 setSelected:NO animated:YES];
            cell1.uiBCheck.titleLabel.text = @"OFF";
            
            //[selectedName removeObjectAtIndex:indexPath.row];
                
            //[[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"NO"];
                
//            if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
            
            [menu layoutIfNeeded];
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
    
    [menu reloadData];
}

@end
