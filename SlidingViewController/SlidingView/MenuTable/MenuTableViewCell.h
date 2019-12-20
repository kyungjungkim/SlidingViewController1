//
//  MenuTableViewCell.h
//  SlidingView
//
//  Created by Kyungjung Kim on 2019/11/13.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *uilGreetings;
@property (weak, nonatomic) IBOutlet UIButton *uiBCheck;

@end

NS_ASSUME_NONNULL_END
