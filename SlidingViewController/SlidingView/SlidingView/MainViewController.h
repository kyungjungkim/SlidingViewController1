//
//  MainViewController.h
//  MainViewController
//
//  Created by Kyungjung Kim on 07/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController {
//    Sliding *slide;
}

@property (weak, nonatomic) IBOutlet UIScrollView *uiScrollView;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView1;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView2;
@property (weak, nonatomic) IBOutlet UITableView *uiTableView3;

- (IBAction)clickedBtnMenu:(UIButton *)sender;

@end
