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
    
    IBOutlet UIView*                _masterContainerView;
    
    IBOutlet UIView*                _detailContainerView;
    
    
    // solution 1:
    
    IBOutlet TSRoundedCornerView*   _roundedCornerView;
    
    // solution 2:
    
    IBOutlet UIView*                _roundedCornerContainer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: _masterContainerView
                                                           attribute: NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeBottom
                                                          multiplier: 1
                                                            constant: 0]];
    
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: _detailContainerView
                                                           attribute: NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeBottom
                                                          multiplier: 1
                                                            constant: 0]];

    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: _detailContainerView
                                                           attribute: NSLayoutAttributeRight
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeRight
                                                          multiplier: 1
                                                            constant: 0]];

    
    _roundedCornerView.corner = UIRectCornerTopLeft;
    _roundedCornerView.backgroundView = _backgroundView;

    [self solution1: nil];
}

- (IBAction) solution1: (id) sender
{
    _roundedCornerView.hidden = NO;
    
    _roundedCornerContainer.layer.cornerRadius = 0;
    _roundedCornerContainer.layer.masksToBounds = NO;
}

- (IBAction) solution2: (id) sender
{
    _roundedCornerView.hidden = YES;
    
    _roundedCornerContainer.layer.cornerRadius = 15;
    _roundedCornerContainer.layer.masksToBounds = YES;
}

@end
