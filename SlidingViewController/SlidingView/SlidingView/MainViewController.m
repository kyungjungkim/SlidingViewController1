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

@synthesize uiScrollView, uiTableView1, uiTableView2, uiTableView3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
            
    
    // Sliding
//    slide = [[Sliding alloc] init:menu];
    
    // UIScrollView
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

- (IBAction)clickedBtnMenu:(UIButton *)sender {
//    [slide menuOpenBtnClick];
}

@end
