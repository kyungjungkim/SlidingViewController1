//
//  Sliding.h
//  Sliding
//
//  Created by Kyungjung Kim on 2019/12/20.
//  Copyright © 2019 prosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//! Project version number for Sliding.
FOUNDATION_EXPORT double SlidingVersionNumber;

//! Project version string for Sliding.
FOUNDATION_EXPORT const unsigned char SlidingVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Sliding/PublicHeader.h>


@interface Sliding : UIView


- (void)menuOpenBtnClick;
- (void)swipeMenuClose;

@end
