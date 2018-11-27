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

@synthesize uivStatusbar, uivTopMenu, uibServiceInfo, uibSetting;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // UISwipeGesture
    upSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMenuUp)];
    upSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [uivTopMenu addGestureRecognizer:upSwipeGesture];
    
    // Hide a Statusbar
    uivStatusbar.hidden = YES;
    
    // TopMenu(Hamburger)
    uivTopMenu.frame = CGRectMake(0.0f, -(uivTopMenu.frame.size.height), uivTopMenu.frame.size.width, uivTopMenu.frame.size.height);
    [self.view addSubview:uivTopMenu];
    
    [uivTopMenu setHidden:YES];
    
    // uibServiceInfo
    [uibServiceInfo setAlpha:0.0f];
    
    // uibSetting
    [uibSetting setAlpha:0.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [locationManager stopUpdatingLocation];
    
    [super viewWillAppear:animated];
}


#pragma mark - IBAction methods

// Open the hamburger menu.
- (IBAction)menuOpenBtnClick:(UIButton *)sender {

    if (uivTopMenu.isHidden == YES) {
        [uivTopMenu setHidden:NO];
    
        // Show a topmenu(Hamburger Menu) in the map.
        [UIView animateWithDuration:0.3f animations:^(void) {
            uivStatusbar.hidden = NO;                               // uivStatusbar hide.
            
            [self.view bringSubviewToFront:uivTopMenu];             // uivTopMenu(Hamburger) bring to front.
            uivTopMenu.frame = CGRectMake(0.0f, 16.0f, SCREEN_WIDTH, uivTopMenu.frame.size.height);
        } completion:^(BOOL finished) {
            if (finished) {
                // Show contents in the HamburgerMenu.
                [UIView animateWithDuration:0.3f animations:^{
                    // uibServiceInfo
                    uibServiceInfo.frame = CGRectMake(uibServiceInfo.frame.origin.x, uibServiceInfo.frame.origin.y - uibServiceInfo.frame.size.height,
                                                      uibServiceInfo.frame.size.width, uibServiceInfo.frame.size.height);
                    [uibServiceInfo setAlpha:1.0f];
                    
                    
                    // uibSetting
                    uibSetting.frame = CGRectMake(uibSetting.frame.origin.x, uibSetting.frame.origin.y - uibSetting.frame.size.height,
                                                  uibSetting.frame.size.width, uibSetting.frame.size.height);
                    [uibSetting setAlpha:1.0f];
                }];
            }
        }];
    }
}

// Close the hamburger menu.
- (IBAction)menuCloseBtnClick:(UIButton *)sender {
    // Hide a topmenu(Hamburger Menu) in the map.
    [UIView animateWithDuration:0.3f animations:^(void) {
        uivTopMenu.frame = CGRectMake(0.0f, -(uivTopMenu.frame.size.height), SCREEN_WIDTH, uivTopMenu.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            // Hide contents int the HamburgerMenu.
            [UIView animateWithDuration:0.3f animations:^{
                // uibServiceInfo
                uibServiceInfo.frame = CGRectMake(uibServiceInfo.frame.origin.x, uibServiceInfo.frame.origin.y + uibServiceInfo.frame.size.height,
                                                  uibServiceInfo.frame.size.width, uibServiceInfo.frame.size.height);
                [uibServiceInfo setAlpha:0.0f];
                
                // uibSetting
                uibSetting.frame = CGRectMake(uibSetting.frame.origin.x, uibSetting.frame.origin.y + uibSetting.frame.size.height,
                                              uibSetting.frame.size.width, uibSetting.frame.size.height);
                [uibSetting setAlpha:0.0f];
            }];
        }
        
        [uivTopMenu setHidden:YES];
        uivStatusbar.hidden = YES;
    }];
}


#pragma mark - Instance methods

- (void)timeoutHandler {
    [ktMapCircle beginRadiusAnimationFrom:0.0f to:30.0f duration:0.7f completeHandler:^{
        ktMapCircle.radius = 0.0f;
    }];
}

// Close hamburger menu.
- (void)swipeMenuUp {
    [UIView animateWithDuration:0.3f animations:^(void) {
        uivTopMenu.frame = CGRectMake(0.0f, -(uivTopMenu.frame.size.height), SCREEN_WIDTH, uivTopMenu.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            // Hide contents int the HamburgerMenu.
            [UIView animateWithDuration:0.3f animations:^{
                // uibServiceInfo
                uibServiceInfo.frame = CGRectMake(uibServiceInfo.frame.origin.x, uibServiceInfo.frame.origin.y + uibServiceInfo.frame.size.height,
                                                  uibServiceInfo.frame.size.width, uibServiceInfo.frame.size.height);
                [uibServiceInfo setAlpha:0.0f];
                
                // uibSetting
                uibSetting.frame = CGRectMake(uibSetting.frame.origin.x, uibSetting.frame.origin.y + uibSetting.frame.size.height,
                                              uibSetting.frame.size.width, uibSetting.frame.size.height);
                [uibSetting setAlpha:0.0f];
                
                // uibTerms
                uibTerms.frame = CGRectMake(uibTerms.frame.origin.x, uibTerms.frame.origin.y + uibTerms.frame.size.height,
                                            uibTerms.frame.size.width, uibTerms.frame.size.height);
                [uibTerms setAlpha:0.0f];
                
                // uibAboutAR
                uibAboutAR.frame = CGRectMake(uibAboutAR.frame.origin.x, uibAboutAR.frame.origin.y + uibAboutAR.frame.size.height,
                                              uibAboutAR.frame.size.width, uibAboutAR.frame.size.height);
                [uibAboutAR setAlpha:0.0f];
                
                // uilLine
                uilLine.frame = CGRectMake(uilLine.frame.origin.x, uilLine.frame.origin.y + uilLine.frame.size.height + 15.0f,
                                           uilLine.frame.size.width, uilLine.frame.size.height);
                [uilLine setAlpha:0.0f];
                
                // uibMobileGuideApp
                uibMobileGuideApp.frame = CGRectMake(uibMobileGuideApp.frame.origin.x, uibMobileGuideApp.frame.origin.y + uibMobileGuideApp.frame.size.height,
                                                     uibMobileGuideApp.frame.size.width, uibMobileGuideApp.frame.size.height);
                [uibMobileGuideApp setAlpha:0.0f];
                
                // uilMobileGuideApp
                uilMobileGuideApp.frame = CGRectMake(uilMobileGuideApp.frame.origin.x, uilMobileGuideApp.frame.origin.y + uilMobileGuideApp.frame.size.height,
                                                     uilMobileGuideApp.frame.size.width, uilMobileGuideApp.frame.size.height);
                [uilMobileGuideApp setAlpha:0.0f];
                
                // uibWizGuideApp
                uibWizGuideApp.frame = CGRectMake(uibWizGuideApp.frame.origin.x, uibWizGuideApp.frame.origin.y + uibWizGuideApp.frame.size.height,
                                                  uibWizGuideApp.frame.size.width, uibWizGuideApp.frame.size.height);
                [uibWizGuideApp setAlpha:0.0f];
                
                // uilWizGuideApp
                uilWizGuideApp.frame = CGRectMake(uilWizGuideApp.frame.origin.x, uilWizGuideApp.frame.origin.y + uilWizGuideApp.frame.size.height,
                                                  uilWizGuideApp.frame.size.width, uilWizGuideApp.frame.size.height);
                [uilWizGuideApp setAlpha:0.0f];
                
                // uilKTSNAppVersion
                uilKTSNAppVersion.frame = CGRectMake(uilKTSNAppVersion.frame.origin.x, uilKTSNAppVersion.frame.origin.y + uilKTSNAppVersion.frame.size.height,
                                                     uilKTSNAppVersion.frame.size.width, uilKTSNAppVersion.frame.size.height);
                [uilKTSNAppVersion setAlpha:0.0f];
            }];
        }
        
        [uivTopMenu setHidden:YES];
        uivStatusbar.hidden = YES;
    }];
}

@end
