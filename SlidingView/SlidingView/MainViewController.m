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
    
    left = [[UITableView alloc] init];
    left.dataSource = self;
    left.delegate = self;
    [left setFrame:CGRectMake(-(self.view.frame.size.width - 100.0f), 100.0f, self.view.frame.size.width - 100.0f, self.view.frame.size.height - 100.0f)];
    left.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:left];
    
    // UISwipeGesture
    UISwipeGestureRecognizer *upSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMenuClose)];
    upSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [left addGestureRecognizer:upSwipeGesture];
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
    // Show a topmenu(Hamburger Menu) in the map.
    [UIView animateWithDuration:0.5f animations:^{
        [self->left setFrame:CGRectMake(0.0f, 100.0f, self.view.frame.size.width - 100, self.view.frame.size.height - 100.0f)];
    } completion:^(BOOL finished) {
        if (finished) {
            // Show contents in the HamburgerMenu.
            self->cell.uilGreetings.frame = CGRectMake(self->cell.uilGreetings.frame.origin.x, self->cell.uilGreetings.frame.origin.y - 10,
                                                 self->cell.uilGreetings.frame.size.width, self->cell.uilGreetings.frame.size.height);
            [self->cell.uilGreetings setAlpha:1.0f];
        }
    }];
}

- (void)swipeMenuClose {
    [UIView animateWithDuration:0.5f animations:^{
        [self->left setFrame:CGRectMake(-(self.view.frame.size.width - 100.0f), 100.0f, self.view.frame.size.width - 100, self.view.frame.size.height - 100.0f)];
    } completion:^(BOOL finished) {
        if (finished) {
            self->cell.uilGreetings.frame = CGRectMake(self->cell.uilGreetings.frame.origin.x, self->cell.uilGreetings.frame.origin.y + 10,
                                                       self->cell.uilGreetings.frame.size.width, self->cell.uilGreetings.frame.size.height);
            [self->cell.uilGreetings setAlpha:1.0f];
        }
    }];
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130.0f;
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
