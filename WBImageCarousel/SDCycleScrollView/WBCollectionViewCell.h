//
//  WBCollectionViewCell.h
//  WBImageCarousel
//
//  Created by 李伟宾 on 15/6/24.
//  Copyright (c) 2015年 李伟宾. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface WBCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) UIImageView *imageView;
@property (copy, nonatomic) NSString *title;

@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIFont *titleLabelTextFont;
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
@property (nonatomic, assign) CGFloat titleLabelHeight;

@property (nonatomic, assign) BOOL hasConfigured;

@end
