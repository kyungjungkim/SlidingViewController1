//
//  MenuTableViewCell.m
//  SlidingView
//
//  Created by Kyungjung Kim on 2019/11/13.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

@synthesize uiBCheck;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    NSLog(@"selected: %d", selected);
}

@end
