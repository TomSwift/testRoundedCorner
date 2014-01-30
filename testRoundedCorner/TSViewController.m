//
//  TSViewController.m
//  testRoundedCorner
//
//  Created by Nicholas Hodapp on 1/30/14.
//  Copyright (c) 2014 Nicholas Hodapp. All rights reserved.
//

#import "TSViewController.h"
#import "TSRoundedCornerView.h"

@interface TSViewController ()

@end

@implementation TSViewController
{
    IBOutlet UIImageView*           _backgroundView;
    
    IBOutlet TSRoundedCornerView*   _roundedCornerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _roundedCornerView.corner = UIRectCornerTopLeft;
    _roundedCornerView.backgroundView = _backgroundView;
}

@end
