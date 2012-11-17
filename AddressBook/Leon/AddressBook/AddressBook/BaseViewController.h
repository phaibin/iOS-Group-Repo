//
//  BaseViewController.h
//  AddressBook
//
//  Created by Leon on 12-11-14.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

+ (UIBarButtonItem *)customBarButtonItemWithTitle:(NSString *)title image:(NSString *)imageName target:(id)target action:(SEL)action;

@end
