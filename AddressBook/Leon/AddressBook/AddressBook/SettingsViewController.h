//
//  SettingsViewController.h
//  AddressBook
//
//  Created by Leon on 12-11-17.
//  Copyright (c) 2012年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : BaseTableViewController

@property (weak, nonatomic) IBOutlet PrettyTableViewCell *userCell;
@property (weak, nonatomic) IBOutlet PrettyTableViewCell *aboutCell;

@end
