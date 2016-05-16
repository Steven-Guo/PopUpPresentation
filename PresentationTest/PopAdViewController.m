//
//  PopAdViewController.m
//  PresentationTest
//
//  Created by Minxin Guo on 5/9/16.
//  Copyright © 2016 aisle411. All rights reserved.
//

#import "PopAdViewController.h"

@interface PopAdViewController ()
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIView *containerView;
@end

@implementation PopAdViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        _imageView = [[UIImageView alloc] init];
        _closeButton = [[UIButton alloc] init];
        _containerView = [[UIView alloc] init];
        [self createUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}

- (void)createUI {
    _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    _containerView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.6];
    _containerView.layer.cornerRadius = 5.0;
    [self.view addSubview:_containerView];
    
    CGFloat bodyFontSize = [self.view bounds].size.width > 667.0 ? 20.0 : 16.0;
    _closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_closeButton setTitle:@"Close" forState:UIControlStateNormal];
    _closeButton.layer.cornerRadius = 5.0;
    _closeButton.titleLabel.font = [UIFont systemFontOfSize:bodyFontSize];
    _closeButton.backgroundColor = [UIColor colorWithRed:116.0/255 green:190.0/255 blue:42.0/255 alpha:1.0];
    [_closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_closeButton];
    
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.clipsToBounds = YES;
    [_containerView addSubview:_imageView];
    NSDictionary *views = @{@"containerView" : _containerView, @"closeButton" : _closeButton, @"imageView" : _imageView};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[containerView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[containerView]|" options:0 metrics:nil views:views]];
    [_containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[imageView(300@250)]-|" options:0 metrics:nil views:views]];
    [_containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[closeButton(100@750)]-50-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    [_containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[imageView]-20-[closeButton(40)]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
}

- (void)setImage: (UIImage *)image {
    [_imageView setImage:image];
}

- (void)close:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end