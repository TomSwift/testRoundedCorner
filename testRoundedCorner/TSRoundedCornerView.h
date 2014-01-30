//
//  TSRoundedCornerView.h
//  testRoundedCorner
//
//  Created by Nicholas Hodapp on 1/30/14.
//  Copyright (c) 2014 Nicholas Hodapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSRoundedCornerView : UIView

@property (nonatomic, weak)   UIImageView* backgroundView;
@property (nonatomic, assign) UIRectCorner corner;

@end
