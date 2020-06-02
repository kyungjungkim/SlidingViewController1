//
//  MenuTableViewCell.h
//  SlidingView
//
//  Created by Kyungjung Kim on 2019/11/13.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TableViewCellDelegate <NSObject>

- (void)clickedBtnCheckWithTag:(long)tag;

@end

@interface MenuTableViewCell : UITableViewCell

@property (nonatomic) id<TableViewCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *uilGreetings;
@property (weak, nonatomic) IBOutlet UIButton *uiBCheck;

- (IBAction)clickedBtnCheck:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
