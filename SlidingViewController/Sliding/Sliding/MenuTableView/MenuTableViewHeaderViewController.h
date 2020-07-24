//
//  MenuTableViewHeaderViewController.h
//  SlidingView
//
//  Created by Kyungjung Kim on 2020/02/27.
//  Copyright © 2020 prosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HeaderViewCellDelegate <NSObject>

- (void)clickedBtnAll;

@end


@interface MenuTableViewHeaderViewController : UIViewController

@property (nonatomic) id<HeaderViewCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *uiBCheck;

- (IBAction)clickedBtnAll:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
