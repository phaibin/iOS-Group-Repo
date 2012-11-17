//
//  LPBarButtonItem.h
//  AddressBook
//
//  Created by Leon on 12-11-17.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LPBarButtonItemTypeNormal,
    LPBarButtonItemTypeBackward,
} LPBarButtonItemType;

@interface LPBarButtonItem : UIBarButtonItem

@property (nonatomic, assign) LPBarButtonItemType type;

- (id)initWithType:(LPBarButtonItemType)theType title:(NSString *)title image:(NSString *)imageName target:(id)target action:(SEL)action;

@end