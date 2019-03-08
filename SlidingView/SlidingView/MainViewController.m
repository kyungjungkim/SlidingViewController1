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
    
    left = [[UIViewController alloc] init];
    [left.view setFrame:CGRectMake(-self.view.frame.size.width, 100.0f, self.view.frame.size.width - 100, 300.0f)];
    left.view.backgroundColor = UIColor.blackColor;
    uivTopMenu = left.view;
    [self.view addSubview:uivTopMenu];
    
    [uivTopMenu setHidden:YES];
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
    [uivTopMenu setHidden:NO];
    
    // Show a topmenu(Hamburger Menu) in the map.
    [UIView animateWithDuration:0.5f animations:^{
        [self->uivTopMenu setFrame:CGRectMake(0.0f, 100.0f, self.view.frame.size.width - 100, 300.0f)];
    } completion:^(BOOL finished) {
        if (finished) {
            // Show contents in the HamburgerMenu.
                
        }
    }];
}


@end
