//
//  MenuTableViewHeaderViewController.m
//  SlidingView
//
//  Created by Kyungjung Kim on 2020/02/27.
//  Copyright © 2020 prosoft. All rights reserved.
//

#import "MenuTableViewHeaderViewController.h"

@interface MenuTableViewHeaderViewController ()

@end

@implementation MenuTableViewHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - IBAction methods

- (IBAction)clickedBtnAll:(UIButton *)sender {
    [self.delegate clickedBtnAll];
}

@end
