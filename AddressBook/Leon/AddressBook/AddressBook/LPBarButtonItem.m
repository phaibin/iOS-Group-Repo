//
//  LPBarButtonItem.m
//  AddressBook
//
//  Created by Leon on 12-11-17.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import "LPBarButtonItem.h"

@implementation LPBarButtonItem

+ (UIImage *)backgroundImageWithType:(LPBarButtonItemType)theType state:(UIControlState)state {
    NSString *filename;
    UIImage *originalImage, *buttonImage;
    NSInteger leftcap, rightcap;
    switch (theType) {
        case LPBarButtonItemTypeBackward: {
            filename = @"bar_btn_back";
            leftcap = 13;
            rightcap = 8;
            break;
        }
        case LPBarButtonItemTypeNormal:
        default: {
            filename = @"bar_btn_normal";
            leftcap = 5;
            rightcap = 5;
            break;
        }
    }
    
    if (state == UIControlStateHighlighted) {
        filename = [filename stringByAppendingString:@"_highlighted"];
    }
    
    originalImage = [UIImage imageNamed:filename];
    
    if ([originalImage respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
        buttonImage = [originalImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, leftcap, 0, rightcap)];
    }
    else {
        buttonImage = [originalImage stretchableImageWithLeftCapWidth:leftcap topCapHeight:0];
    }
    return buttonImage;
}

+ (UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)imageName type:(LPBarButtonItemType)theType {
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalButtonImage = [[self class] backgroundImageWithType:theType state:UIControlStateNormal];
    UIImage *highlightedButtonImage = [[self class] backgroundImageWithType:theType state:UIControlStateHighlighted];
    [aButton setBackgroundImage:normalButtonImage forState:UIControlStateNormal];
    [aButton setBackgroundImage:highlightedButtonImage forState:UIControlStateHighlighted];
    if (title) {
        [aButton setTitle:title forState:UIControlStateNormal];
        UIFont *font = [UIFont boldSystemFontOfSize:12];
        aButton.titleLabel.font = font;
        CGSize labelSize = [title sizeWithFont:font];
        aButton.titleLabel.shadowColor = [UIColor grayColor];
        aButton.titleLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        
        if (theType == LPBarButtonItemTypeBackward) {
            aButton.frame = CGRectMake(0, 0, labelSize.width + 26, normalButtonImage.size.height);
            aButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        } else {
            aButton.frame = CGRectMake(0, 0, labelSize.width + 22, normalButtonImage.size.height);
        }
    } else {
        UIImage *buttonImage = [UIImage imageNamed:imageName];
        [aButton setImage:buttonImage forState:UIControlStateNormal];
        [aButton setImage:buttonImage forState:UIControlStateHighlighted];
        aButton.frame = CGRectMake(0, 0, buttonImage.size.width + 22, normalButtonImage.size.height);
    }
    return aButton;
}

- (id)initWithType:(LPBarButtonItemType)theType title:(NSString *)title image:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton *button = [[self class] buttonWithTitle:title image:imageName type:theType];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if ((self = [super initWithCustomView:button])) {
        self.type = theType;
        self.target = target;
        self.title = title;
        self.action = action;
    }
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    UIButton *button = (UIButton *)(self.customView);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
}

@end