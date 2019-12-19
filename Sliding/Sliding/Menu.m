//
//  Menu.m
//  Sliding
//
//  Created by Kyungjung Kim on 2019/12/19.
//  Copyright © 2019 prosoft. All rights reserved.
//

#import "Menu.h"

@implementation Menu



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = UIColor.lightGrayColor;
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

@end
